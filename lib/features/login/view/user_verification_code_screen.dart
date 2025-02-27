import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../../core/widgets/primary_button.dart';
import 'user_confirmation_screen.dart';

class UserVerificationCodeScreen extends StatelessWidget {
  final String codeReceiver;
  const UserVerificationCodeScreen({super.key, required this.codeReceiver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text('تأكيد الحساب', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(
                'من فضلك اكتب الكود المرسل الي $codeReceiver', 
                maxLines: 3,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              Container(
                width: 173,
                height: 173,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/code_confirmation.png'), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              VerificationCode(
                autofocus: true,
                fullBorder: true,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                onCompleted: (code) {}, 
                onEditing: (finished) {},
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'ارسال الكود مرة اخري؟', 
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(height: 80),
              PrimaryButton(
                text: 'تأكيد الحساب', 
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserConfirmationScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}