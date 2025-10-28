import 'package:flutter/material.dart';
import '../core/widgets/custom_text_fields.dart';
import '../../routes/app_routes.dart';
import '../screens/main_screen.dart';
import 'verify_sms.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;
  final VoidCallback onToggle;

  const AuthForm({
    super.key,
    required this.isLogin,
    required this.onToggle,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  // 🔒 Statik kullanıcı bilgileri
  final String staticPhone = "05000000000";
  final String staticPassword = "123456";

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      if (widget.isLogin) {
        // LOGIN modunda: şifre kontrolü
        if (phoneCtrl.text.trim() == staticPhone &&
            passwordCtrl.text.trim() == staticPassword) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Giriş başarılı ✅')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Telefon numarası veya şifre hatalı ❌')),
          );
        }
      } else {
        // REGISTER modunda: SMS doğrulama ekranına yönlendir
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Doğrulama kodu gönderildi 📱')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VerifySmsPage(phoneNumber: phoneCtrl.text.trim()),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: phoneCtrl,
            label: 'Telefon Numarası',
            icon: Icons.phone,
          ),
          const SizedBox(height: 16),
          // if (widget.isLogin)
            CustomTextField(
              controller: passwordCtrl,
              label: 'Şifre',
              icon: Icons.lock,
              obscureText: true,
            ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _handleSubmit,
            child: Text(widget.isLogin ? 'Giriş Yap' : 'Kayıt Ol'),
          ),
          TextButton(
            onPressed: widget.onToggle,
            child: Text(
              widget.isLogin
                  ? 'Hesabın yok mu? Kayıt ol'
                  : 'Zaten hesabın var mı? Giriş yap',
            ),
          ),
        ],
      ),
    );
  }
}
