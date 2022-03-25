import 'dart:convert';
import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/datasources/firebase/firebase_service.dart';
import 'package:mobile/src/data/model/user_data.dart';

class AuthenticationRepository {
  final BaseApi baseApi;
  final FirebaseService firebaseService;
  AuthenticationRepository(
      {required this.baseApi, required this.firebaseService});

  Future<UserData?> loginWithGoogle() async {
    try {
      final String tokenId = await firebaseService.signInWithGoogle();
      final String responseBody = await baseApi
          .postMethod("/auth/login-with-google", body: {"tokenId": tokenId});
      final Map<String, dynamic> responseDecoded = jsonDecode(responseBody);
      final UserData newUser = UserData.fromJson(responseDecoded);
      return newUser;
    } catch (e) {
      log("Exception in loginWithGoogle from AuthenticationRepository: ${e.toString()}");
      return null;
    }
  }
}
