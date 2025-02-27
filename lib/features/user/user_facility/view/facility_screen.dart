import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search/components/search_component.dart';
import '../../search/components/suggest_search_component.dart';
import '../../user_cart/view/user_cart_screen.dart';
import '../../user_home/components/user_home_screen_bar_component.dart';
import '../../user_home/model/user_home_facilities_model.dart';
import '../view_model/cubit/facility_cubit.dart';

class FacilityScreen extends StatelessWidget {
  final UserHomeFacilitiesModel facility;
  const FacilityScreen({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
        create: (context) => FacilityCubit(),
        child: BlocBuilder<FacilityCubit, FacilityState>(
          builder: (context, state) {
            var cubit = FacilityCubit.get(context);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    UserHomeScreenBarComponent(
                      img: 'assets/images/profile_img.png', 
                      name: 'أهلا,محمد  حسن', 
                      activeLocation: () => cubit.getLocation(),
                      showCart: true,
                      openCart: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UserCartScreen(type: facility.type))),
                    ),
                    Image.asset(facility.img, height: 250, width: double.infinity, fit: BoxFit.cover),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 8,
                            runSpacing: 8,
                            children: cubit.filterOptions.map((e) => SuggestSearchComponent(suggest: e, onTap: () => cubit.selectFilter(e), isSelected: cubit.selectedFilter == e)).toList(),
                          ),
                          const SizedBox(height: 24),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: cubit.filteredProducts.length,
                            itemBuilder: (context, index) {
                              var product = cubit.filteredProducts[index];
                              return SearchComponent(
                                img: product.img,
                                title: product.title,
                                pricing: product.pricing,
                                description: product.description,
                                onTap: () => cubit.openProductDetails(product, context),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}