import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/widgets/custom_text_form_feild.dart';
import '../../../core/widgets/primary_button.dart';
import 'user_login_screen.dart';
import 'user_verification_code_screen.dart';

class UserRegisterScreen extends StatelessWidget {
  const UserRegisterScreen({super.key});

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
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'أدخل بياناتك لأنشاء الحساب', 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 60),
              Card(
                elevation: 2,
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                  child: Column(
                    children: [
                      const CustomTextFormField(hintText: 'البريد الالكتروني', preffixIcon: Icon(Icons.mail_outlined)),
                      const SizedBox(height: 20),
                      const CustomTextFormField(hintText: 'الاسم', preffixIcon: Icon(Icons.edit_outlined)),
                      const SizedBox(height: 20),
                      const CustomTextFormField(hintText: 'الهاتف', preffixIcon: Icon(Icons.phone_outlined)),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        hintText: 'كلمة السر', 
                        preffixIcon: const Icon(Icons.key_off), 
                        suffixIcon: IconButton(
                          onPressed: () {}, 
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        hintText: 'تأكيد كلمة السر', 
                        preffixIcon: const Icon(Icons.key_off), 
                        suffixIcon: IconButton(
                          onPressed: () {}, 
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              PrimaryButton(
                text: 'انشاء حساب', 
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserVerificationCodeScreen(codeReceiver: '01223975494',))),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'لديك حساب بالفعل؟  ',
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'تسجيل دخول', 
                      style: TextStyle(color: HexColor('#34B1DD')),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserLoginScreen())),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}