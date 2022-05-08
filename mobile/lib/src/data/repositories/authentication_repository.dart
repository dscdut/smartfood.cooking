import 'dart:convert';
import 'dart:developer';

import 'package:mobile/src/data/datasources/api/base_api.dart';
import 'package:mobile/src/data/datasources/firebase/firebase_service.dart';
import 'package:mobile/src/data/model/user_data.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required this.baseApi,
    required this.firebaseService,
  });

  final BaseApi baseApi;
  final FirebaseService firebaseService;

  Future<UserData?> loginWithGoogle() async {
    try {
      final tokenId = await firebaseService.signInWithGoogle();
      final responseBody = await baseApi.postMethod(
        '/auth/login-with-google',
        body: <String, dynamic>{'tokenId': tokenId},
      );
      final responseDecoded = jsonDecode(responseBody) as Map<String, dynamic>;
      return UserData.fromJson(responseDecoded);
    } catch (e) {
      log(
        'Exception in loginWithGoogle : ${e.toString()}',
      );
      return null;
    }
  }
}
