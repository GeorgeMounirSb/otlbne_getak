import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'sub_facility_home_state.dart';

class SubFacilityHomeCubit extends Cubit<SubFacilityHomeState> {
  SubFacilityHomeCubit() : super(SubFacilityHomeInitial());

  static SubFacilityHomeCubit get(context) => BlocProvider.of(context);
}
