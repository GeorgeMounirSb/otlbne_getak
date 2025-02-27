import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:otlbne_getak/features/user/user_cart/model/cart_product_model.dart';

import '../../../../../core/helper/user_location_service.dart';

part 'user_cart_state.dart';

class UserCartCubit extends Cubit<UserCartState> {
  UserCartCubit() : super(UserCartInitial());

  static UserCartCubit get(context) => BlocProvider.of(context);

  List<CartProductModel> cartProducts = [
    CartProductModel(id: '1', img: 'assets/images/offer2.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '560 ر.س', qty: 2),
    CartProductModel(id: '2', img: 'assets/images/offer2.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '560 ر.س', qty: 1),
    CartProductModel(id: '3', img: 'assets/images/offer2.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '560 ر.س', qty: 4),
    CartProductModel(id: '4', img: 'assets/images/offer2.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '560 ر.س', qty: 3),
    CartProductModel(id: '5', img: 'assets/images/offer2.png', title: 'تشيكن فيلا', description: 'دجاج مشوي طازج مع توابل مميزة، يقدم مع خبز طري، خس، طماطم، وصلصة خاصة تمنحك طعمًا غنيًا ومذاقًا لا يقاوم. اختياريًا، يمكن إضافة جبنة سائلة لإثراء النكه', pricing: '560 ر.س', qty: 2),
  ];
  List<CartProductModel> extraProducts = [
    CartProductModel(id: '11', img: 'assets/images/french_fries.png', title: 'باكت فرايز', description: 'صغيرة', pricing: '5 ر.س', qty: 0),
    CartProductModel(id: '12', img: 'assets/images/french_fries.png', title: 'باكت فرايز', description: 'صغيرة', pricing: '5 ر.س', qty: 0),
    CartProductModel(id: '13', img: 'assets/images/french_fries.png', title: 'باكت فرايز', description: 'صغيرة', pricing: '5 ر.س', qty: 0),
    CartProductModel(id: '14', img: 'assets/images/water_bottle.png', title: 'مياه معدنية', description: 'صغيرة', pricing: '5 ر.س', qty: 0),
    CartProductModel(id: '15', img: 'assets/images/water_bottle.png', title: 'مياه معدنية', description: 'صغيرة', pricing: '5 ر.س', qty: 0),
  ];
  List<String> orderTypes = ['تجهيز الطلب للأستلام', 'حجز طاولة', 'توصيل للبيت'];
  String selectedFilter = '';
  final List<int> hours = List.generate(12, (index) => index + 1);
  final List<int> minutes = List.generate(60, (index) => index);
  final List<String> periods = ['ص', 'م'];
  int selectedHour = 1, selectedMinute = 0, selectedCount = 0, homeType = 2;
  String selectedPeriod = 'ص';
  UserLocationService locationService = UserLocationService();

  setCartOtpions(String type) {
    switch(type) {
      case 'restaurants':
        orderTypes = ['تجهيز الطلب للأستلام', 'حجز طاولة', 'توصيل للبيت'];
        break;
      case 'medical':
        orderTypes = [];
        break;
      case 'education':
        orderTypes = [];
        break;
      case 'cars':
        orderTypes = [];
        break;
      default:
        orderTypes = ['تجهيز الطلب للأستلام', 'توصيل للبيت'];
        break;
    }
    emit(SetOrderTypes());
  }
  selectFilter(String filter) {
    selectedFilter = filter;
    emit(SelectFilter());
  }
  getLocation() async {
    await locationService.initLocation();
    await locationService.activeLocation();
  }
  selectHour(int hour) => selectedHour = hour + 1;
  selectMinute(int minute) => selectedMinute = minute;
  selectPeriod(String period) => selectedPeriod = period;
  selectCount(int count) {
    selectedCount = count;
    emit(SelectCount());
  }
  selectHomeType(int type) {
    homeType = type;
    emit(SelectHomeType());
  }
  changeQty(int index, bool isIncrease, BuildContext context) {
    if (isIncrease) {
      cartProducts[index].qty++;
    } else {
      if (cartProducts[index].qty > 1) {
        cartProducts[index].qty--;
      }else {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: const Text('تنبيه'),
            content: const Text('هل تريد حذف هذا المنتج من السلة؟'),
            actions: [
              TextButton(
                onPressed: () {
                  cartProducts.removeAt(index);
                  Navigator.pop(context);
                }, 
                child: const Text('نعم'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: const Text('لا'),
              ),
            ],
          ),
        );
      }
    }
    emit(ChangeProductQty());
  }
}