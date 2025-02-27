import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../model/sub_facility_orders_model.dart';

part 'sub_facility_orders_state.dart';

class SubFacilityOrdersCubit extends Cubit<SubFacilityOrdersState> {
  SubFacilityOrdersCubit() : super(SubFacilityOrdersInitial());

  static SubFacilityOrdersCubit get(context) => BlocProvider.of(context);

  final TextEditingController searchController = TextEditingController();
  String selectedFilter = "بانتظار الموافقة";
  final List<String> filters = [
    "بانتظار الموافقة",
    "بانتظار التحضير",
    "جاري التوصيل",
    "تم التوصيل",
    "ملغي"
  ];
  List<SubFacilityOrdersModel> orders = [
    SubFacilityOrdersModel(id: '#12345', client: 'أحمد محمد', phone: '0123456789', total: '250\$', status: 'بانتظار الموافقة'),
    SubFacilityOrdersModel(id: '#12346', client: 'سارة علي', phone: '0123456790', total: '180\$', status: 'جاري التوصيل'),
    SubFacilityOrdersModel(id: '#12347', client: 'خالد سعيد', phone: '0123456781', total: '300\$', status: 'ملغي'),
    SubFacilityOrdersModel(id: '#12348', client: 'منى أحمد', phone: '0123456782', total: '220\$', status: 'تم التوصيل'),
    SubFacilityOrdersModel(id: '#12349', client: 'يوسف حسن', phone: '0123456783', total: '450\$', status: 'بانتظار التحضير'),
    SubFacilityOrdersModel(id: '#12349', client: 'يوسف حسن', phone: '0123456783', total: '450\$', status: 'عند الوصول'),
    SubFacilityOrdersModel(id: '#12349', client: 'يوسف حسن', phone: '0123456783', total: '450\$', status: 'حجز طاولة'),
  ];
  List<SubFacilityOrdersModel> filteredOrders = [];

  Color getStatusColor(String status) {
    switch (status) {
      case "بانتظار الموافقة":
        return Colors.orange;
      case "بانتظار التحضير":
        return Colors.blue;
      case "جاري التوصيل":
      case "عند الوصول":
        return Colors.purple;
      case "تم التوصيل":
        return Colors.green;
      case "ملغي":
        return Colors.red;
      case "حجز طاولة":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
  Widget getStatusIcon(String status) {
    switch (status) {
      case "بانتظار الموافقة":
        return const Icon(Icons.hourglass_empty, color: Colors.orange);
      case "بانتظار التحضير":
        return const Icon(Icons.kitchen, color: Colors.blue);
      case "جاري التوصيل":
      case "عند الوصول":
        return const Icon(Icons.local_shipping, color: Colors.purple);
      case "تم التوصيل":
        return const Icon(Icons.check_circle, color: Colors.green);
      case "ملغي":
        return const Icon(Icons.cancel, color: Colors.red);
      case "حجز طاولة":
        return const Icon(Icons.table_bar, color: Colors.blue);
      default:
        return const Icon(Icons.help_outline, color: Colors.grey);
    }
  }
  changeOrdersStatus(String status) {
    selectedFilter = status;
    filterOrders();
  }
  setFilters(bool isReservation) {
    if(isReservation) {
      filters.remove("جاري التوصيل");
      filters.remove("تم التوصيل");
      filters.add('عند الوصول');
      filters.add('حجز طاولة');
      emit(ChangeFilters());
    }
  }
  filterOrders() {
    filteredOrders = orders.where((order) {
      final matchesFilter = order.status == selectedFilter;
      final matchesSearch = order.client.contains(searchController.text) || order.id.contains(searchController.text);
      return matchesFilter && matchesSearch;
    }).toList();
    emit(FilterFacilityOrders());
  }
}