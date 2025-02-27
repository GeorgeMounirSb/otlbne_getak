import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../model/search_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  String selectedSuggest = '';
  List<String> suggestions = ['chicken fila', 'أجهزة الكترونية', 'cars', 'cafe'];
  List<SearchModel> searchItems = [
    SearchModel(img: 'assets/images/fac_pro_img.png', title: 'chicken fila', description: '(458)', pricing: '20 د - 16.99 ج.م', rate: '4.5'),
    SearchModel(img: 'assets/images/fac_pro_img.png', title: 'أجهزة الكترونية', description: '(458)', pricing: '20 د - 16.99 ج.م', rate: '4.5'),
    SearchModel(img: 'assets/images/fac_pro_img.png', title: 'cars', description: '(458)', pricing: '20 د - 16.99 ج.م', rate: '4.5'),
    SearchModel(img: 'assets/images/fac_pro_img.png', title: 'cafe', description: '(458)', pricing: '20 د - 16.99 ج.م', rate: '4.5'),
  ];
  List<SearchModel> searchResults = [];

  closeAndClearSearch() {
    searchController.clear();
    selectedSuggest = '';
    searchResults = [];
    searchFocus.unfocus();
    emit(SearchInitial());
  }
  selectSuggest(String suggest) {
    selectedSuggest = suggest;
    searchController.text = suggest;
    filterItems();
  }
  filterItems() {
    searchResults = searchItems.where((element) => element.title.toLowerCase().contains(searchController.text.toLowerCase())).toList();
    emit(SearchFiltered());
  }
}