import 'package:flutter/material.dart';
import 'package:otlbne_getak/features/user/user_cars_facilities/view/main_cars_facility_screen.dart';
import 'package:otlbne_getak/features/user/user_medical_facilities/view/main_medical_facility_screen.dart';

import '../../../../core/utils/media_query_values.dart';
import '../../user_facility/view/facility_screen.dart';
import '../model/user_home_facilities_model.dart';

class UserHomeFacilitiesComponent extends StatelessWidget {
  final UserHomeFacilitiesModel facility;
  const UserHomeFacilitiesComponent({super.key, required this.facility});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(facility.type == 'medical') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UserMedicalFacilityScreen(facility: facility)));
        } else if (facility.type == 'cars') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MainCarsFacilityScreen(facility: facility)));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FacilityScreen(facility: facility)));
        }
      },
      child: SizedBox(
        width: context.width * 0.53,
        height: context.height * 0.15,
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(facility.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text(
                                '${facility.time}.${facility.price}', 
                                style: const TextStyle(color: Colors.grey), 
                                textDirection: TextDirection.ltr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.access_time, color: Colors.grey, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(facility.img, width: context.width * 0.17, height: context.height, fit: BoxFit.cover),
              ],
            ),
          ),
        ),
      ),
    );
  }
}