import 'package:dartz/dartz.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/model/response/login_response.dart';
import 'package:ibeauty/domain/model/response/verify_phone_response.dart';

abstract class AuthInterface {

  Future<Either<bool, dynamic>> checkPhone({
    required String phone,
  });

  Future<Either<LoginResponse, dynamic>> login({
    required String phone,
    required String password,
  });

  Future<Either<LoginResponse, dynamic>> loginWithSocial({
    required String email,
    required String displayName,
    required String id,
    required String? img,
  });

  Future<Either<VerifyData, dynamic>> sigUpWithPhone({
    required UserModel user,
  });


  Future<Either<LoginResponse, dynamic>> forgotPasswordAfter({
    required String phone,
    required String verificationId,
    required String password,
  });


  Future updateSetting();

  Future updateFirebaseToken(String? token);

  Future logout();

  Future deleteAccount();
}
