// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/http_helper.dart';
import '../../../../../core/utils/end_points.dart';
import '../../../../../core/helper/data_helper.dart';
import '../../../../../core/widgets/toast_widget.dart';
import '../../../../login/view/user_selection_screen.dart';

part 'captain_profile_state.dart';

class CaptainProfileCubit extends Cubit<CaptainProfileState> {
  CaptainProfileCubit() : super(CaptainProfileInitial());

  static CaptainProfileCubit get(context) => BlocProvider.of(context);

  bool isWorking = false, isLoading = false;
  String name = '', phone = '';
  TextEditingController startDateController = TextEditingController(), endDateController = TextEditingController();

  pickDate(context, bool isStart) async{
    DateTime? pickedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2000), 
      lastDate: DateTime(2050),
    );
    if(pickedDate != null){
      if(isStart){
        startDateController.text = pickedDate.toString().split(' ')[0];
      }else{
        endDateController.text = pickedDate.toString().split(' ')[0];
      }
    }
    if(startDateController.text.isNotEmpty && endDateController.text.isNotEmpty){
      await getOrders(context);
    }
  }
  getProfile(BuildContext context) async {
    try {
      isLoading = true;
      emit(CaptainProfileLoading());
      final instance = DataHelper.instance;
      final body = {'idder': instance.id.toString()};
      final response = await HTTPHelper.httpPost(context, EndPoints.captProfile, body);
      final data = jsonDecode(response);
      if(data['success'] == true) {
        isWorking = data['is_onduty'] == 1;
        name = data['user_full_name'];
        phone = data['mobile_number'];
      }
    }catch(e) {
      ToastWidget().showToast(context);
    }
    isLoading = false;
    emit(CaptainProfileLoaded());
  }
  getOrders(BuildContext context) async {
    try {
      isLoading = true;
      emit(CaptainProfileLoading());
      final instance = DataHelper.instance;
      final body = {
        'idder': instance.id.toString(),
        'date_from': startDateController.text,
        'date_to': endDateController.text,
      };
      final response = await HTTPHelper.httpPost(context, EndPoints.captOrders, body);
      final data = jsonDecode(response);
      if(data['success'] == true) {
        ///get orders here
      }
    }catch (e) {
      ToastWidget().showToast(context);
    }
    isLoading = false;
    emit(CaptainProfileLoaded());
  }
  changeWorkStatus(BuildContext context) async {
    try {
      isLoading = true;
      emit(CaptainProfileLoading());
      final instance = DataHelper.instance;
      final body = {
        'rider_id': instance.id.toString(),
        'is_onduty': isWorking ? '0' : '1',
      };
      final response = await HTTPHelper.httpPost(context, EndPoints.updateOnduty, body);
      final data = jsonDecode(response);
      if(data['success'] == true) {
        isWorking = !isWorking;
        emit(CaptainToggleStatus());
      }
    }catch(e) {
      ToastWidget().showToast(context);
    }
    isLoading = false;
    emit(CaptainProfileLoaded());
  }
  logout(BuildContext context) async {
    try {
      final instance = DataHelper.instance;
      if(!isWorking) {
        await changeWorkStatus(context);
      }
      await instance.reset();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSelectionScreen()));
    }catch(e) {
      ToastWidget().showToast(context, message: 'حدث خطأ أثناء تسجيل الخروج');
    }
  }
}