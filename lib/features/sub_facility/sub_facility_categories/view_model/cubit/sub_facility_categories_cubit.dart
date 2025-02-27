import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../model/sub_facility_category_model.dart';

part 'sub_facility_categories_state.dart';

class SubFacilityCategoriesCubit extends Cubit<SubFacilityCategoriesState> {
  SubFacilityCategoriesCubit() : super(SubFacilityCategoriesInitial());

  static SubFacilityCategoriesCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  final List<SubFacilityCategoryModel> categories = [
      SubFacilityCategoryModel(id: '1', englishName: 'Burger', arabicName: 'برجر'),
      SubFacilityCategoryModel(id: '2', englishName: 'Pizza', arabicName: 'بيزا'),
      SubFacilityCategoryModel(id: '3', englishName: 'Pasta', arabicName: 'بستا'),
    ];
}
