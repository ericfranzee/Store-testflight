// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/components/join_dialog.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseService {
  FirebaseService._();

  static final FirebaseFirestore store = FirebaseFirestore.instance;

  static Future<String> getFcmToken() async {
    final firebaseM = FirebaseMessaging.instance;
    firebaseM.requestPermission(
      sound: true,
      alert: true,
      badge: false,
    );
    return await firebaseM.getToken() ?? "";
  }

  static Future<Either<UserCredential, dynamic>> socialGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    googleSignIn.disconnect();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken);

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return left(userCredential);
    } catch (e) {
      return right(e.toString());
    }
  }

  static Future<Either<UserCredential, dynamic>> socialFacebook() async {
    final fb = FacebookLogin();
    try {
      final user = await fb.logIn(permissions: []);

      final OAuthCredential credential =
          FacebookAuthProvider.credential(user.accessToken?.token ?? "");

      final userObj =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return left(userObj);
    } catch (e) {
      return right(e.toString());
    }
  }

  static Future<Either<UserCredential, dynamic>> socialApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      OAuthProvider oAuthProvider = OAuthProvider("apple.com");
      final AuthCredential credentialApple = oAuthProvider.credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      final userObj =
          await FirebaseAuth.instance.signInWithCredential(credentialApple);
      return left(userObj);
    } catch (e) {
      return right(e.toString());
    }
  }

  static sendCode(
      {required String phone,
      required ValueChanged<String> onSuccess,
      required ValueChanged<String> onError}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        onError(e.message ?? '');
      },
      codeSent: (String verificationId, int? resendToken) {
        onSuccess(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static Future<Either<UserCredential, dynamic>> checkCode(
      {required String verificationId, required String code}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      return left(user);
    } catch (e) {
      return right(e.toString());
    }
  }

  static Future<void> initDynamicLinks(BuildContext context) async {
    final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    dynamicLinks.onLink.listen((dynamicLinkData) {
      String link = dynamicLinkData.link.toString();
      if (link.contains("group")) {
        showJoin(context, link.toString());
      }
    }).onError((error) {
      debugPrint(error.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    if (deepLink.toString().contains("group")) {
      showJoin(context, deepLink.toString());
    }
  }

  static showJoin(BuildContext context, String link) {
    AppHelper.showCustomDialog(
        context: context,
        content: JoinDialog(
          link: link,
        ));
  }
}
