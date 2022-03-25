import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class FirebaseService {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final Client http;
  FirebaseService(
      {required this.firebaseAuth,
      required this.googleSignIn,
      required this.http});

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      final User? currentUser = userCredential.user;
      final String tokenId = await currentUser!.getIdToken();
      return tokenId;
    } else {
      throw Exception("Google sign in fail");
    }
  }
}
