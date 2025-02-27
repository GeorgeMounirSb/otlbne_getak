// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:otlbne_getak/core/helper/http_helper.dart';
import 'package:otlbne_getak/core/utils/end_points.dart';
import 'package:otlbne_getak/core/widgets/toast_widget.dart';
import 'package:otlbne_getak/features/captain/captain_home/view/captain_home_screen.dart';

import '../../../../core/helper/data_helper.dart';
import '../../../sub_facility/sub_facility_home/view/sub_facility_home_screen.dart';
import '../../view/default_login_screen.dart';
import '../../view/user_login_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  String selectedType = '';
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController(), passwordController = TextEditingController();

  changeSelectionUserType(String type) {
    selectedType = type;
    emit(TypeChanged());
  }
  userSwitcher() {
    switch(selectedType) {
      case 'user':
        return const UserLoginScreen();
      case 'driv':
        return const DefaultLoginScreen(facility: false);
      case 'fac':
        return const DefaultLoginScreen(facility: true);
    }
  }
  ///login main functions
  changePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(PasswordVisibilityChanged());
  }
  defaultLogin(BuildContext context, bool isFacility) async {
    if(isFacility) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SubFacilityHomeScreen()));
    } else {
      await captainLogin(context);
    }
  }
  ///captain
  captainLogin(BuildContext context) async{
    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        ToastWidget().showToast(context, message: "يرجى إدخال البريد الإلكتروني وكلمة المرور");
        return;
      }
      final body = {
        'user_email': emailController.text,
        'user_pass': passwordController.text,
      };
      final response = await HTTPHelper.httpPost(context, EndPoints.capLogin, body);
      final data = jsonDecode(response);
      if(data['success'] == true) {
        final instance = DataHelper.instance;
        instance.token = data['message'];
        instance.name = data['user_name'];
        instance.id = data['rider_id'];
        instance.userType = 1;
        await instance.set();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const CaptainHomeScreen()), (route) => false);
      } else {
        ToastWidget().showToast(context, message: data['message']);
      }
    } catch (e) {
      ToastWidget().showToast(context);
    }
  }
}