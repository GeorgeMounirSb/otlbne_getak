import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/user_location_service.dart';
import '../../../search/model/search_model.dart';

part 'facility_state.dart';

class FacilityCubit extends Cubit<FacilityState> {
  FacilityCubit() : super(FacilityInitial());

  static FacilityCubit get(context) => BlocProvider.of(context);

  bool homeLoading = false, availableLocation = false, locationSkipped = false;
  List<String> filterOptions = ['أضاف حديثا', 'عروض', 'توصيل مجاني', 'الأعلي تقييما'];
  String selectedFilter = '';
  List<SearchModel> filteredProducts = [
    SearchModel(img: 'assets/images/offer1.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '650 ر.س'),
    SearchModel(img: 'assets/images/offer1.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '650 ر.س'),
    SearchModel(img: 'assets/images/offer1.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '650 ر.س'),
    SearchModel(img: 'assets/images/offer1.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '650 ر.س'),
    SearchModel(img: 'assets/images/offer1.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '650 ر.س'),
    SearchModel(img: 'assets/images/offer1.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '650 ر.س'),
    SearchModel(img: 'assets/images/offer1.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '650 ر.س'),
  ];
  List<SearchModel> cartProducts = [];
  UserLocationService locationService = UserLocationService();

  getLocation() async {
    await locationService.initLocation();
    await locationService.activeLocation();
  }
  selectFilter(String filter) {
    selectedFilter = filter;
    emit(FacilityProductsFiltered());
  }
  addToCart(SearchModel product) {
    if(!cartProducts.contains(product)) {
      cartProducts.add(product);
      emit(FacilityProductAddedFromCart());
    }
  }
  openProductDetails(SearchModel product, BuildContext context) {
    int qty = 1;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                  product.img,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(product.pricing, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(product.description, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => addToCart(product),
                        icon: const Icon(Icons.shopping_cart, color: Colors.white),
                        label: const Text("اضافة الي عربة التسوق", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.add, color: Colors.blue), 
                                  onPressed: () {
                                    setState(() {
                                      qty++;
                                    });
                                  },
                                ),
                                Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold)),
                                IconButton(
                                  icon: const Icon(Icons.remove, size: 16), 
                                  onPressed: () {
                                    if(qty > 1) {
                                      setState(() {
                                        qty--;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}