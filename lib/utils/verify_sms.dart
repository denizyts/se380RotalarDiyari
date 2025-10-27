import 'package:flutter/material.dart';
import '../core/widgets/custom_text_fields.dart';
import '../../routes/app_routes.dart';

class VerifySmsPage extends StatefulWidget {
  final String phoneNumber;

  const VerifySmsPage({super.key, required this.phoneNumber});

  @override
  State<VerifySmsPage> createState() => _VerifySmsPageState();
}

class _VerifySmsPageState extends State<VerifySmsPage> {
  final codeCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _verifyCode() {
    if (_formKey.currentState!.validate()) {
      if (codeCtrl.text.trim() == '000000') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Doğrulama başarılı ✅')),
        );
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kod hatalı ❌')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Doğrulama'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${widget.phoneNumber} numarasına SMS gönderildi 📲',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: codeCtrl,
                  label: '6 Haneli Kod',
                  icon: Icons.sms,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _verifyCode,
                  child: const Text('Doğrula'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
