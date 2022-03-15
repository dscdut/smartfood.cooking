import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class FirebaseService {
  final FirebaseAuth authService;
  final GoogleSignIn googleSignIn;
  final Client http;
  FirebaseService({required this.authService, required this.googleSignIn, required this.http});

  Future<void> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception();
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    log(googleAuth!.accessToken!);
    log(googleAuth.idToken!);
    await authService.signInWithCredential(credential);
    final token = await getCurrenUser();
    log(token);
    // final respones = await http.post(
    //   Uri.parse(
    //       "https://e3dd-2402-800-6294-92b3-c2c0-b9d4-d954-ea19.ngrok.io/api/auth/login-with-google"),
    //   body: token,
    // );
    // print(respones.statusCode);
    // if (respones.statusCode == 200) {
    //   print(respones.body);
    // } else {
    //   print(respones.body);
    // }
  }

  Future<String> getCurrenUser() async {
    final user = authService.currentUser;
    final idToken = await user!.getIdToken();
    return idToken;
  }
}