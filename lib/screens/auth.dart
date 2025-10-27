import 'package:flutter/material.dart';
import '../utils/auth_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? 'Giriş Yap' : 'Kayıt Ol'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AuthForm(
            isLogin: isLogin,
            onToggle: () => setState(() => isLogin = !isLogin),
          ),
        ),
      ),
    );
  }
}
