import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user_components/user_better_experience_component.dart';
import '../components/user_home_categories_component.dart';
import '../components/user_home_facilities_component.dart';
import '../components/user_home_main_categories_component.dart';
import '../components/user_home_offers_component.dart';
import '../components/user_home_screen_bar_component.dart';
import '../model/user_home_facilities_model.dart';
import '../view_model/cubit/user_home_cubit.dart';
import '../components/user_home_most_selling_component.dart';
import '../model/user_home_categories_model.dart';
import '../model/user_home_most_selling_model.dart';
import '../model/user_home_offers_model.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
        create: (context) => UserHomeCubit(),
        child: BlocBuilder<UserHomeCubit, UserHomeState>(
          builder: (context, state) {
            var cubit = UserHomeCubit.get(context);
            return Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UserHomeScreenBarComponent(
                          img: 'assets/images/profile_img.png', 
                          name: 'أهلا,محمد  حسن', 
                          activeLocation: () => cubit.getLocation(),
                          showCart: true,
                          openCart: () {},
                        ),
                        CarouselSlider(
                          items: cubit.ads.map((e) => Image.asset(e, width: double.infinity, height: 250, fit: BoxFit.cover)).toList(),
                          options: CarouselOptions(height: 250, viewportFraction: 1, autoPlay: true, autoPlayInterval: const Duration(seconds: 3)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserHomeMainCategoriesComponent<UserHomeCategoriesModel>(
                                title: 'الفئات',
                                items: cubit.categories,
                                itemBuilder: (cat) => UserHomeCategoriesComponent(cat: cat),
                              ),
                              UserHomeMainCategoriesComponent<UserHomeOffersModel>(
                                title: 'العروض',
                                items: cubit.offers,
                                itemBuilder: (offer) => UserHomeOffersComponent(offer: offer),
                              ),
                              UserHomeMainCategoriesComponent<UserHomeMostSellingModel>(
                                title: 'الأكثر مبيعا',
                                items: cubit.mostProducts,
                                itemBuilder: (product) => UserHomeMostSellingComponent(product: product),
                              ),
                              UserHomeMainCategoriesComponent<UserHomeFacilitiesModel>(
                                title: 'المطاعم',
                                items: cubit.facilities,
                                itemBuilder: (facility) => UserHomeFacilitiesComponent(facility: facility),
                                filterCondition: (facility) => facility.type == 'restaurants',
                              ),
                              UserHomeMainCategoriesComponent<UserHomeFacilitiesModel>(
                                title: 'التموين',
                                items: cubit.facilities,
                                itemBuilder: (facility) => UserHomeFacilitiesComponent(facility: facility),
                                filterCondition: (facility) => facility.type == 'supplies',
                              ),
                              UserHomeMainCategoriesComponent<UserHomeFacilitiesModel>(
                                title: 'العيادات و المستشفيات',
                                items: cubit.facilities,
                                itemBuilder: (facility) => UserHomeFacilitiesComponent(facility: facility),
                                filterCondition: (facility) => facility.type == 'medical',
                              ),
                              // UserHomeMainCategoriesComponent<UserHomeFacilitiesModel>(
                              //   title: 'مراكز تعليم',
                              //   items: cubit.facilities,
                              //   itemBuilder: (facility) => UserHomeFacilitiesComponent(facility: facility),
                              //   filterCondition: (facility) => facility.type == 'education',
                              // ),
                              UserHomeMainCategoriesComponent<UserHomeFacilitiesModel>(
                                title: 'معارض سيارات',
                                items: cubit.facilities,
                                itemBuilder: (facility) => UserHomeFacilitiesComponent(facility: facility),
                                filterCondition: (facility) => facility.type == 'cars',
                              ),
                              UserHomeMainCategoriesComponent<UserHomeFacilitiesModel>(
                                title: 'معارض الكترونيات',
                                items: cubit.facilities,
                                itemBuilder: (facility) => UserHomeFacilitiesComponent(facility: facility),
                                filterCondition: (facility) => facility.type == 'electronies',
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(!cubit.availableLocation && !cubit.locationSkipped) 
                UserBetterExperienceComponent(activeLocation: () => cubit.getLocation(), skip: () => cubit.skipLocation()),
              ],
            );
          },
        ),
      ),
    );
  }
}