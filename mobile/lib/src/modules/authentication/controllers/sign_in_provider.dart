import 'package:flutter/material.dart';
import 'package:mobile/src/data/repositories/authentication_repository.dart';

class SignInProvider with ChangeNotifier {
  AuthenticationRepository authenticationRepository;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  SignInProvider({required this.authenticationRepository});

  bool showPassword = true;

  void onTapEyeIcon() {
    showPassword = !showPassword;
  }

  Future<void> onTapSigninWithGoogle() async {
    // ignore: unused_local_variable
    final newUser = await authenticationRepository.loginWithGoogle();

    //TODO: action tap SignIn
  }
}
