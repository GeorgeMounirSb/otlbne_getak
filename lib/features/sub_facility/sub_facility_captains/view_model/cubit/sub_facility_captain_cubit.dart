import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../model/sub_facility_captains_model.dart';

part 'sub_facility_captain_state.dart';

class SubFacilityCaptainCubit extends Cubit<SubFacilityCaptainState> {
  SubFacilityCaptainCubit() : super(SubFacilityCaptainInitial());

  static SubFacilityCaptainCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  String selectedStatus = "الكل";
  Color bgColor = Colors.grey.shade300;
  IconData icon = Icons.info;
  List<String> statusOptions = [
    "الكل",
    "بانتظار موافقة السائق",
    "في الطريق",
    "تمت"
  ];
  List<SubFacilityCaptainsModel> subFacilityCaptains = [
    SubFacilityCaptainsModel(id: '#123', date: '12/12/2022', captain: 'محمد', area: 'القاهرة', status: 'بانتظار موافقة السائق'),
    SubFacilityCaptainsModel(id: '#456', date: '12/12/2022', captain: 'محمد', area: 'القاهرة', status: 'في الطريق'),
    SubFacilityCaptainsModel(id: '#789', date: '12/12/2022', captain: 'محمد', area: 'القاهرة', status: 'تمت'),
  ];
  List<SubFacilityCaptainsModel> filteredSubFacilityCaptains = [];

  getCaptainsData() {
    filteredSubFacilityCaptains = subFacilityCaptains;
    emit(GetCaptainsData());
  }
  changeStatus(String status) {
    selectedStatus = status;
    emit(ChangeStatusFilter());
    filterOrders();
  }
  filterOrders() {
    String query = searchController.text.toLowerCase().trim();
    filteredSubFacilityCaptains = subFacilityCaptains.where((e) {
      bool matchesSearch = e.date.toLowerCase().contains(query) || e.id.toLowerCase().contains(query) ||
                          e.area.toLowerCase().contains(query) || e.captain.toLowerCase().contains(query);
      bool matchesStatus = selectedStatus == "الكل" || e.status == selectedStatus;
      return matchesSearch && matchesStatus;
    }).toList();
    emit(FilterOrders());
  }
  switchStatus(String status) {
    switch (status) {
      case "بانتظار موافقة السائق":
        bgColor = Colors.orange.shade200;
        icon = Icons.hourglass_top;
        break;
      case "في الطريق":
        bgColor = Colors.blue.shade200;
        icon = Icons.local_shipping;
        break;
      case "تمت":
        bgColor = Colors.green.shade200;
        icon = Icons.check_circle;
        break;
      default:
        bgColor = Colors.grey.shade300;
        icon = Icons.info;
    }
  }
}