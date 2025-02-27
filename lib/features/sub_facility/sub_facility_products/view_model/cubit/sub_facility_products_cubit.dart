import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../model/sub_facility_product_model.dart';

part 'sub_facility_products_state.dart';

class SubFacilityProductsCubit extends Cubit<SubFacilityProductsState> {
  SubFacilityProductsCubit() : super(SubFacilityProductsInitial());

  static SubFacilityProductsCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool status = false;
  String? selectedType, selectedCategory;
  List<SubFacilityProductModel> products = [
    SubFacilityProductModel(
      id: "1",
      englishName: "Cheese Burger",
      arabicName: "تشيز برجر",
      image: "assets/images/cheese_burger.png",
      status: "Active",
      type: "Product",
      category: "Burgers",
      description: "A juicy beef burger with melted cheese, lettuce, and tomato.",
      price: "50",
      discPrice: "40",
    ),
    SubFacilityProductModel(
      id: "2",
      englishName: "Ranch Pizza",
      arabicName: "بيتزا رانش",
      image: "assets/images/ranch_pizza.png",
      status: "Active",
      type: "Product",
      category: "Pizzas",
      description: "A delicious pizza topped with ranch sauce, chicken, and mozzarella cheese.",
      price: "120",
      discPrice: "100",
    ),
    SubFacilityProductModel(
      id: "3",
      englishName: "Chicken Shawarma Sandwich",
      arabicName: "ساندويتش شاورما دجاج",
      image: "assets/images/chicken_shawarma.png",
      status: "Active",
      type: "Product",
      category: "Sandwiches",
      description: "Grilled chicken shawarma wrapped in fresh pita bread with garlic sauce.",
      price: "45",
      discPrice: "35",
    ),
    SubFacilityProductModel(
      id: "4",
      englishName: "Pepperoni Pizza",
      arabicName: "بيتزا بيبروني",
      image: "assets/images/pepperoni_pizza.png",
      status: "Active",
      type: "Product",
      category: "Pizzas",
      description: "A crispy pizza topped with pepperoni slices and melted cheese.",
      price: "110",
      discPrice: "90",
    ),
    SubFacilityProductModel(
      id: "5",
      englishName: "BBQ Beef Burger",
      arabicName: "برجر لحم مع صوص الباربكيو",
      image: "assets/images/bbq_beef_burger.png",
      status: "Active",
      type: "Product",
      category: "Burgers",
      description: "A grilled beef burger with BBQ sauce, crispy onions, and cheddar cheese.",
      price: "60",
      discPrice: "50",
    ),
    SubFacilityProductModel(
      id: "6",
      englishName: "Veggie Pizza",
      arabicName: "بيتزا الخضار",
      image: "assets/images/veggie_pizza.png",
      status: "Active",
      type: "Product",
      category: "Pizzas",
      description: "A fresh pizza loaded with bell peppers, olives, mushrooms, and tomatoes.",
      price: "100",
      discPrice: "85",
    ),
    SubFacilityProductModel(
      id: "7",
      englishName: "Crispy Chicken Sandwich",
      arabicName: "ساندويتش دجاج مقرمش",
      image: "assets/images/crispy_chicken_sandwich.png",
      status: "Active",
      type: "Product",
      category: "Sandwiches",
      description: "Crispy fried chicken with lettuce, mayo, and pickles in a soft bun.",
      price: "55",
      discPrice: "45",
    ),
  ];
  List<SubFacilityProductModel> filteredProducts = [];

  changeType(String? type) => selectedType = type;
  loadProductData(String? proId) {}
  toggleStatus(bool? val) {}
  deleteProduct(String proId) {}
  showAddProductDialog(BuildContext context) {}
  showEditProductDialog(BuildContext context, SubFacilityProductModel  product) {}
}
