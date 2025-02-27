import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/main_appbar.dart';
import '../view_model/cubit/captain_order_map_cubit.dart';

class CaptainOrderMapScreen extends StatelessWidget {
  final LatLng firstDesignation, secondDesignation;

  const CaptainOrderMapScreen({super.key, required this.firstDesignation, required this.secondDesignation});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaptainOrderMapCubit()..initializeMap(firstDesignation),
      child: BlocBuilder<CaptainOrderMapCubit, CaptainOrderMapCubitState>(
        builder: (context, state) {
          var cubit = CaptainOrderMapCubit.get(context);
          return Scaffold(
            appBar: const AppbarCenterTitle(title: 'الطريق الي المطعم'),
            body: Stack(
              children: [
                cubit.mapInitialized ? GoogleMap(
                  onMapCreated: (controller) => cubit.mapController = controller,
                  initialCameraPosition: cubit.initialPosition,
                  markers: cubit.markers,
                  polylines: cubit.polyLines,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                ) : const Center(child: CircularProgressIndicator()),
              ],
            ),
            floatingActionButton: cubit.mapInitialized ? FloatingActionButton(
              onPressed: () => cubit.goToCurrentLocation(),
              backgroundColor: ColorsManager.dark,
              child: const Icon(Icons.navigation, color: Colors.white),
            ) : const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}