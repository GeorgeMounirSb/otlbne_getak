import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:otlbne_getak/features/login/view/user_register_screen.dart';

import '../../../core/widgets/custom_text_form_feild.dart';
import '../../../core/widgets/primary_button.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

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
              const Text(
                'أهلاً بك من جديد! استمتع بتجربة طعام فريدة مع طلبك التالي', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                width: 173,
                height: 173,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/login_user.png'), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const CustomTextFormField(hintText: 'البريد الالكتروني', preffixIcon: Icon(Icons.mail_outlined)),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'كلمة السر', 
                preffixIcon: const Icon(Icons.key_off), 
                suffixIcon: IconButton(
                  onPressed: () {}, 
                  icon: const Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(height: 50),
              PrimaryButton(
                text: 'تسجيل دخول', 
                onTap: () {},
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'ليس لديك حساب؟  ',
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'انشاء حساب', 
                      style: TextStyle(color: HexColor('#34B1DD')),
                      recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserRegisterScreen())),
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