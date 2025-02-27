import 'package:flutter/material.dart';
import 'package:otlbne_getak/core/theming/colors.dart';

import '../../../core/utils/media_query_values.dart';
import '../../../core/widgets/primary_button.dart';

class UserBetterExperienceComponent extends StatelessWidget {
  final Function() activeLocation, skip;
  const UserBetterExperienceComponent({super.key, required this.activeLocation, required this.skip});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: context.width,
      height: context.height,
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          Container(
            width: 173,
            height: 173,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/images/location_request.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'للحصول على أفضل تجربة توصيل وتحديد المطاعم الأقرب إليك، من فضلك قم بمنحنا إذن الوصول إلى موقعك!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Expanded(child: SizedBox()),
          PrimaryButton(text: 'السماح', onTap: activeLocation),
          const SizedBox(height: 16),
          TextButton(onPressed: skip, child: const Text('تخطي', style: TextStyle(color: ColorsManager.black, decoration: TextDecoration.underline))),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}