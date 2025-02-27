import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/primary_button.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../search/components/suggest_search_component.dart';
import '../../user_home/components/user_home_screen_bar_component.dart';
import '../view_model/cubit/user_cart_cubit.dart';
import '../components/user_cart_product.dart';
import '../components/user_cart_extra_product.dart';
import '../components/invoice_row_component.dart';
import '../components/user_cart_select_table.dart';
import '../components/user_cart_select_time.dart';

class UserCartScreen extends StatelessWidget {
  final String type;
  const UserCartScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
        create: (context) => UserCartCubit()..setCartOtpions(type),
        child: BlocBuilder<UserCartCubit, UserCartState>(
          builder: (context, state) {
            var cubit = UserCartCubit.get(context);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UserHomeScreenBarComponent(
                      img: 'assets/images/profile_img.png', 
                      name: 'أهلا,محمد  حسن', 
                      activeLocation: () => cubit.getLocation(),
                      showCart: false,
                      showSearch: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.cartProducts.length,
                            itemBuilder: (context, index) {
                              var pro = cubit.cartProducts[index];
                              return UserCartProduct(
                                product: pro, 
                                increase: () => cubit.changeQty(index, true, context), 
                                decrease: () => cubit.changeQty(index, false, context),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: context.width * 0.1),
                      child: const Divider(height: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const Text('يمكنك اضافة ايضا', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: cubit.extraProducts.map((e) => UserCartExtraProduct(product: e)).toList(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text('كيف تريد طلبك', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: Wrap(
                              spacing: 4,
                              runSpacing: 8,
                              children: cubit.orderTypes.map((e) => SuggestSearchComponent(suggest: e, onTap: () => cubit.selectFilter(e), isSelected: cubit.selectedFilter == e)).toList(),
                            ),
                          ),
                          if(cubit.selectedFilter == 'حجز طاولة')
                          ...[
                            const SizedBox(height: 24),
                            UserCartSelectTable(selectedNumber: cubit.selectedCount, selectNumber: (count) => cubit.selectCount(count)),
                            const SizedBox(height: 24),
                            UserCartSelectTime(
                              selectHours: (hour) => cubit.selectHour(hour), 
                              selectMinutes: (min) => cubit.selectMinute(min), 
                              hours: cubit.hours, 
                              minutes: cubit.minutes, 
                              selectPeriod: (per) => cubit.selectPeriod(per), 
                              periods: cubit.periods,
                            ),
                          ],
                          if(cubit.selectedFilter == 'تجهيز الطلب للأستلام')
                          ...[
                            const SizedBox(height: 24),
                            UserCartSelectTime(
                              selectHours: (hour) => cubit.selectHour(hour), 
                              selectMinutes: (min) => cubit.selectMinute(min), 
                              hours: cubit.hours, 
                              minutes: cubit.minutes, 
                              selectPeriod: (per) => cubit.selectPeriod(per), 
                              periods: cubit.periods,
                            ),
                          ],
                          if(cubit.selectedFilter == 'توصيل للبيت')
                          ...[
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    value: 0, 
                                    groupValue: cubit.homeType, 
                                    onChanged: (val) => cubit.selectHomeType(val!), 
                                    title: const Text('توصيل فوري'),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: RadioListTile(
                                      value: 1, 
                                      groupValue: cubit.homeType, 
                                      onChanged: (val) => cubit.selectHomeType(val!), 
                                      title: const Text('توصيل لاحقا'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if(cubit.homeType == 1)
                            UserCartSelectTime(
                              selectHours: (hour) => cubit.selectHour(hour), 
                              selectMinutes: (min) => cubit.selectMinute(min), 
                              hours: cubit.hours, 
                              minutes: cubit.minutes, 
                              selectPeriod: (per) => cubit.selectPeriod(per), 
                              periods: cubit.periods,
                            ),
                          ],
                          const SizedBox(height: 24),
                          const Text('تفاصيل الدفع', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 16),
                          Column(
                            children: [
                              const InvoiceRowComponent(title: 'السعر', price: '1500 ر.س'),
                              if(cubit.selectedFilter == 'توصيل للبيت')
                              const InvoiceRowComponent(title: 'التوصيل', price: '20 ر.س'),
                              const InvoiceRowComponent(title: 'ضريبة', price: '10 ر.س'),
                              const InvoiceRowComponent(title: 'السعر الكلي', price: '1530 ر.س'),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.center,
                            child: PrimaryButton(
                              text: 'استمرار',
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(height: 16),
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