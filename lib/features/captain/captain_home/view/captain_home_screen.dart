import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../captain_components/captain_order_card.dart';
import '../../captain_profile/view/captain_profile_screen.dart';
import '../../captain_order_maps/view/captain_order_map_screen.dart';
import '../view_model/cubit/captain_home_cubit.dart';
import '../components/waiting_for_work_component.dart';

class CaptainHomeScreen extends StatelessWidget {
  const CaptainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الصفحة الرئيسية', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: ColorsManager.dark)),
                IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CaptainProfileScreen())), icon: Icon(Icons.person, color: ColorsManager.dark, size: 30)),
              ],
            ),
            Expanded(
              child: BlocProvider(
                create: (context) => CaptainHomeCubit()..checkWorkAvailability(context),
                child: BlocBuilder<CaptainHomeCubit, CaptainHomeState>(builder: (context, state) {
                  var cubit = CaptainHomeCubit.get(context);
                  return !cubit.availableForWork ? 
                    WaitingForWorkComponent(loading: cubit.homeLoading, startWork: cubit.homeLoading ? null : () => cubit.startWork(context)) : 
                    Column(
                      children: [
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.error,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              icon: const Icon(Icons.block, size: 20),
                              label: const Text('ايقاف العمل'),
                              onPressed: () => cubit.stopWork(context),
                            ),
                            if(cubit.currentCountry.isNotEmpty)
                            CountryFlag.fromCountryCode(
                              cubit.currentCountry,
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                        const Spacer(),
                        if(cubit.availableOrders)
                          CaptainOrderCard(
                            showActions: true, 
                            refuseOrder: () => cubit.refuseOrder(), 
                            acceptOrder: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CaptainOrderMapScreen(
                              firstDesignation: LatLng(30.055669178540477, 31.35795133891176),
                              secondDesignation: LatLng(30.118846255189748, 31.34032151007796),
                            ))),
                          )
                        else (
                          Column(
                            children: [
                              SvgPicture.asset('assets/images/deliver_on_way.svg', width: context.width * 0.6, height: context.height * 0.4),
                              const SizedBox(height: 20),
                              Text('برجاء الانتظار لاستقبال طلبات', style: TextStyle(color: ColorsManager.dark, fontSize: 20, fontWeight: FontWeight.bold)),
                            ],
                          )
                        ),
                        const Spacer(flex: 2),
                      ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}