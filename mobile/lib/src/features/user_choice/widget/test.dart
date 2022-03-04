import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApiTest {
  final FirebaseAuth authService;
  final GoogleSignIn googleSignIn;

  ApiTest(this.authService, this.googleSignIn);

  Future<void> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception();
    }
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    print(googleAuth?.accessToken);
    print(googleAuth?.idToken);
    // final response = await client.post(
    //     Uri.parse(
    //         "https://65e6-2402-800-6294-92b3-3cbd-689c-2974-e7d.ngrok.io/api/auth/login-with-google"),
    //     body: {"tokenId": googleAuth!.idToken});

    // if (response.statusCode == 200) {
    //   print(response.body);
    // } else {
    //   print(response.body);
    // }
  }
}
