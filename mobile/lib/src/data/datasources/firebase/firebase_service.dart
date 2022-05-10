import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

class FirebaseService {
  
  FirebaseService({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.http,
  });
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final Client http;
  
  Future<String> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
      final currentUser = userCredential.user;
      final tokenId = await currentUser!.getIdToken();
      return tokenId;
    } else {
      throw Exception('Google sign in fail');
    }
  }
}
