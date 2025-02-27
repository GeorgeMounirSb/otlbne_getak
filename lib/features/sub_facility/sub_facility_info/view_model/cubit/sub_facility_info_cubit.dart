import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../model/sub_facility_days_model.dart';

part 'sub_facility_info_state.dart';

class SubFacilityInfoCubit extends Cubit<SubFacilityInfoState> {
  SubFacilityInfoCubit() : super(SubFacilityInfoInitial());

  static SubFacilityInfoCubit get(context) => BlocProvider.of(context);

  final TextEditingController minOrderController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController arabicNameController = TextEditingController();
  final TextEditingController englishNameController = TextEditingController();
  final TextEditingController arabicDescController = TextEditingController();
  final TextEditingController englishDescController = TextEditingController();

  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lngController = TextEditingController();
  List<SubFacilityDaysModel> days = [
    SubFacilityDaysModel(day: 'الاثنين', startTime: const TimeOfDay(hour: 9, minute: 00), endTime: const TimeOfDay(hour: 18, minute: 00), isHoliday: false),
    SubFacilityDaysModel(day: 'الثلاثاء', startTime: const TimeOfDay(hour: 9, minute: 00), endTime: const TimeOfDay(hour: 18, minute: 00), isHoliday: false),
    SubFacilityDaysModel(day: 'الاربعاء', startTime: const TimeOfDay(hour: 9, minute: 00), endTime: const TimeOfDay(hour: 18, minute: 00), isHoliday: false),
    SubFacilityDaysModel(day: 'الخميس', startTime: const TimeOfDay(hour: 9, minute: 00), endTime: const TimeOfDay(hour: 18, minute: 00), isHoliday: false),
    SubFacilityDaysModel(day: 'الجمعة', startTime: const TimeOfDay(hour: 9, minute: 00), endTime: const TimeOfDay(hour: 18, minute: 00), isHoliday: false),
    SubFacilityDaysModel(day: 'السبت', startTime: const TimeOfDay(hour: 9, minute: 00), endTime: const TimeOfDay(hour: 18, minute: 00), isHoliday: false),
    SubFacilityDaysModel(day: 'الاحد', startTime: const TimeOfDay(hour: 9, minute: 00), endTime: const TimeOfDay(hour: 18, minute: 00), isHoliday: false),
  ];
  bool facilityActive = true;

  pickTime(BuildContext context, SubFacilityDaysModel day, bool isStart) async{
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: isStart ? day.startTime : day.endTime,
    );
    if (pickedTime != null) {
      if (isStart) {
        day.startTime = pickedTime;
      } else {
        day.endTime = pickedTime;
      }
    }
    emit(PickTime());
  }
  changeDayHoliday(SubFacilityDaysModel day, bool isHoliday) {
    day.isHoliday = isHoliday;
    emit(ChangeDayHoliday());
  }
  changeFacilityAvailability(bool isActive) {
    facilityActive = isActive;
    emit(ChangeFacilityAvailability());
  }
}