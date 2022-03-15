import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/datasources/firebase/firebase_service.dart';

class AuthenticationRepository {
  final BaseApi baseApi;
  final FirebaseService firebaseService;
  AuthenticationRepository(
      {required this.baseApi, required this.firebaseService});

  Future<void> loginWithGoogle() async {
    try {
      final String tokenId = await firebaseService.signInWithGoogle();
      final String responseBody = await baseApi
          .postMethod("/auth/login-with-google", body: {"tokenId": tokenId});
      print(responseBody);
    } catch (e) {
      log("Login with Google fail in AuthRepository: ${e.toString()}");
    }
  }
}
