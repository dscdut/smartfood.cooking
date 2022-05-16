import 'package:flutter/material.dart';
import 'package:mobile/src/data/repositories/authentication_repository.dart';

class SignInProvider with ChangeNotifier {
  SignInProvider({required this.authenticationRepository});

  final AuthenticationRepository authenticationRepository;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  bool showPassword = true;

  void onTapEyeIcon() {
    showPassword = !showPassword;
  }

  Future<void> onTapSigninWithGoogle() async {
    await authenticationRepository.loginWithGoogle();

    //TODO: action tap SignIn
  }
}
