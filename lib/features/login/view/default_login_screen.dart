import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_text_form_feild.dart';
import '../../../core/widgets/primary_button.dart';
import '../view_model/cubit/login_cubit.dart';

class DefaultLoginScreen extends StatelessWidget {
  final bool facility;
  const DefaultLoginScreen({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
              return Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    facility
                        ? ' قم بتسجيل الدخول لإدارة الطلبات والحجوزات'
                        : 'مرحباً بك مجدداً! استعد لرحلة توصيل جديدة وكن جزءًا من تجربة العملاء',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 173,
                    height: 173,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(facility
                            ? 'assets/images/login_facility.png'
                            : 'assets/images/login_driver.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    controller: cubit.emailController,
                    hintText: 'البريد الالكتروني',
                    preffixIcon: const Icon(Icons.mail_outlined),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: cubit.passwordController,
                    hintText: 'كلمة السر',
                    preffixIcon: const Icon(Icons.key_off),
                    suffixIcon: IconButton(
                      onPressed: () => cubit.changePasswordVisibility(),
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(height: 50),
                  PrimaryButton(
                    text: 'تسجيل دخول',
                    onTap: () => cubit.defaultLogin(context, facility),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
