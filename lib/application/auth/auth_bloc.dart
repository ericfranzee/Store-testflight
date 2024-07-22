// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/auth.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/firebase/firebase_service.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthInterface _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState()) {
    bool isForgetPassword = false;
    String? refreshToken;

    on<Login>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await _authRepository.login(
          phone: event.phone, password: event.password);
      res.fold((l) async {
        await LocalStorage.setToken(l.data?.accessToken ?? "");
        LocalStorage.setUser(l.data?.user);
        event.onSuccess?.call();
        final fcm = await FirebaseService.getFcmToken();
        _authRepository.updateFirebaseToken(fcm);
        userRepository.setLikeProductList(
            ids: LocalStorage.getLikedProductsList());
      }, (r) {
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
      emit(state.copyWith(isLoading: false));
    });

    on<SocialSignIn>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      Either<UserCredential, dynamic>? user;
      switch (event.type) {
        case FlutterRemix.apple_fill:
          user = await FirebaseService.socialApple();
          break;
        case FlutterRemix.google_fill:
          user = await FirebaseService.socialGoogle();
          break;
        case FlutterRemix.facebook_fill:
          user = await FirebaseService.socialFacebook();
          break;
      }

      user?.fold((l) async {
        String? token = await l.user?.getIdToken();
        final res = await _authRepository.loginWithSocial(
            email: l.user?.email ?? "",
            displayName: l.user?.displayName ?? "",
            id: token ?? "",
            img: l.user?.photoURL);

        res.fold((l) async {
          await LocalStorage.setToken(l.data?.accessToken ?? "");
          LocalStorage.setUser(l.data?.user);
          event.context.read<AuthBloc>().add(const AuthEvent.loadingChange());
          event.onSuccess?.call();
          final fcm = await FirebaseService.getFcmToken();
          _authRepository.updateFirebaseToken(fcm);
          userRepository.setLikeProductList(
              ids: LocalStorage.getLikedProductsList());
        }, (r) {
          event.context.read<AuthBloc>().add(const AuthEvent.loadingChange());
          AppHelper.errorSnackBar(
            context: event.context,
            message: r,
          );
        });
      }, (r) {
        event.context.read<AuthBloc>().add(const AuthEvent.loadingChange());
      });
    });

    on<SignUp>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await _authRepository.sigUpWithPhone(
          user: UserModel(
              firstname: event.firstname,
              lastname: event.lastname,
              email: event.email,
              phone: event.phone,
              refreshToken: refreshToken,
              password: event.password,
              referral: event.referral
          ));
      res.fold((l) async {
        await LocalStorage.setToken(l.token ?? "");
        LocalStorage.setUser(l.user);
        event.onSuccess?.call();
        final fcm = await FirebaseService.getFcmToken();
        _authRepository.updateFirebaseToken(fcm);
        userRepository.setLikeProductList(
            ids: LocalStorage.getLikedProductsList());
      }, (r) {
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
      emit(state.copyWith(isLoading: false));
    });

    on<SetVerificationId>((event, emit) async {
      emit(state.copyWith(
          screenType: AuthType.confirm, verificationId: event.id));
    });

    on<ShowPassword>((event, emit) {
      emit(state.copyWith(isShowPassword: !state.isShowPassword));
    });

    on<ShowConfirmPassword>((event, emit) {
      emit(state.copyWith(isShowConfirmPassword: !state.isShowConfirmPassword));
    });

    on<SwitchScreen>((event, emit) {
      isForgetPassword = (event.type == AuthType.forgetPassword);
      emit(state.copyWith(screenType: event.type));
    });

    on<CheckVerify>((event, emit) async {
      refreshToken = null;
      emit(state.copyWith(isLoading: true, isError: false));
      final res = await FirebaseService.checkCode(
          verificationId: event.verifyId, code: event.code);
      if (event.editPhone ?? false) {
        res.fold((l) {
          Navigator.pop(event.context, true);
        }, (r) {
          emit(state.copyWith(isLoading: false, isError: true));
        });
      }
      res.fold((l) async {
        refreshToken = await l.user?.getIdToken();
      }, (r) {});
      res.fold((l) {
        emit(state.copyWith(
            isLoading: false,
            screenType: isForgetPassword
                ? AuthType.updatePassword
                : AuthType.signUpFull));
      }, (r) {
        emit(state.copyWith(isLoading: false, isError: true));
      });
    });

    on<CheckPhone>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await _authRepository.checkPhone(phone: event.phone);
      res.fold((l) {
        if (isForgetPassword && l) {
          emit(state.copyWith(isLoading: false));
          event.onSuccess?.call();
          return;
        }
        if (l) {
          emit(state.copyWith(isLoading: false));
          AppHelper.errorSnackBar(
              context: event.context,
              message: AppHelper.getTrn(TrKeys.thisPhoneAlreadyExist));
          return;
        }
        if (!l && isForgetPassword) {
          emit(state.copyWith(isLoading: false));
          AppHelper.errorSnackBar(
              context: event.context,
              message: AppHelper.getTrn(TrKeys.thisPhoneAlreadyNoExist));
          return;
        }
        emit(state.copyWith(isLoading: false));
        event.onSuccess?.call();
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<ForgotPasswordAfter>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await _authRepository.forgotPasswordAfter(
          phone: event.phone,
          password: event.password,
          verificationId: refreshToken ?? "");
      res.fold((l) async {
        await LocalStorage.setToken(l.data?.accessToken ?? "");
        LocalStorage.setUser(l.data?.user);
        event.onSuccess?.call();
        final fcm = await FirebaseService.getFcmToken();
        _authRepository.updateFirebaseToken(fcm);
        userRepository.setLikeProductList(
            ids: LocalStorage.getLikedProductsList());
      }, (r) {
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
      emit(state.copyWith(isLoading: false));
    });

    on<LoadingChange>((event, emit) {
      emit(state.copyWith(isLoading: false));
    });
  }
}
