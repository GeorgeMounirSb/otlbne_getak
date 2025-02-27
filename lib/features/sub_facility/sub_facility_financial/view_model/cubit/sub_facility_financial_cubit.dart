import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../model/sub_facility_financial_model.dart';

part 'sub_facility_financial_state.dart';

class SubFacilityFinancialCubit extends Cubit<SubFacilityFinancialState> {
  SubFacilityFinancialCubit() : super(SubFacilityFinancialInitial());

  static SubFacilityFinancialCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  TextEditingController startDateController = TextEditingController(), endDateController = TextEditingController();
  String selectedTab = 'الطلبات';
  List<SubFacilityFinancialModel> financialData = [
    SubFacilityFinancialModel(id: "1001", client: "أحمد محمد", date: "2024-02-10", total: "1500", type: "الطلبات"),
    SubFacilityFinancialModel(id: "1002", client: "سارة علي", date: "2024-02-11", total: "2200", type: "الطلبات"),
    SubFacilityFinancialModel(id: "1003", client: "خالد يوسف", date: "2024-02-12", total: "1800", type: "الدفعات"),
    SubFacilityFinancialModel(id: "1004", client: "منى حسن", date: "2024-02-13", total: "2500", type: "الدفعات"),
  ];
  List<SubFacilityFinancialModel> filteredFinancialData = [];

  getFinancialData() async{
    filterFinancialData();
  }
  filterFinancialData() {
    filteredFinancialData = financialData.where((element) => 
      (element.id.contains(searchController.text) || 
      element.client.contains(searchController.text) ||
      element.total.contains(searchController.text)) &&
      element.type == selectedTab).toList();
    emit(FilterFinancialData());
  }
  pickDate(BuildContext context, bool isStart) async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if(pickedDate != null){
      if(isStart){
        startDateController.text = pickedDate.toString().split(' ')[0];
      }else{
        endDateController.text = pickedDate.toString().split(' ')[0];
      }
    }
  }
  changeTab(String tab) {
    selectedTab = tab;
    filterFinancialData();
  }
}