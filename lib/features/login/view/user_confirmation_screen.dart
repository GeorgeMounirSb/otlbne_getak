import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../user/user_home/view/user_home_screen.dart';
import '../../../core/widgets/primary_button.dart';

class UserConfirmationScreen extends StatelessWidget {
  const UserConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 3),
              Gif(
                image: const AssetImage('assets/images/verified.gif'),
                autostart: Autostart.once,
              ),
              const Spacer(),
              Text('تهانينا!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: HexColor('#34B1DD'))),
              const SizedBox(height: 16),
              const Text('تم انشاء حسابك بنجاح', style: TextStyle(fontSize: 18)),
              const Spacer(),
              PrimaryButton(
                text: 'ابدأ التصفح', 
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const UserHomeScreen())),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}