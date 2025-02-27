import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/media_query_values.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/primary_button.dart';

class WaitingForWorkComponent extends StatelessWidget {
  final Function()? startWork;
  final bool loading;
  const WaitingForWorkComponent({super.key, this.startWork, required this.loading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        SvgPicture.asset('assets/images/waiting_request.svg', width: context.width * 0.6, height: context.height * 0.4),
        const SizedBox(height: 10),
        Text('ابدأ العمل لبدأ استقبال طلبات', style: TextStyle(color: ColorsManager.dark, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        PrimaryButton(
          text: 'بدأ العمل', 
          onTap: startWork,
          child: loading ? const CircularProgressIndicator(color: Colors.white) : null,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}