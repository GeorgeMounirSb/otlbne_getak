import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/primary_button.dart';
import '../../../core/theming/colors.dart';
import '../view_model/cubit/login_cubit.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorsManager.textFormFillColor, Colors.grey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Text('حدد نوع حسابك لبدأ استخدام التطبيق', style: TextStyle(fontSize: 22, color: ColorsManager.dark, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            BlocProvider(
              create: (context) => LoginCubit(),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  var cubit = LoginCubit.get(context);
                  return Column(
                    children: [
                      UserSelectionOption(
                        title: 'مستخدم', 
                        desc: 'اذا كنت ترغب في طلب طعام', 
                        icon: Icons.person, 
                        onTap: () => cubit.changeSelectionUserType('user'),
                        selected: cubit.selectedType == 'user',
                      ),
                      UserSelectionOption(
                        title: 'مندوب توصيل', 
                        desc: 'اذا كنت تعمل كمندوب توصيل', 
                        icon: Icons.delivery_dining, 
                        onTap: () => cubit.changeSelectionUserType('driv'),
                        selected: cubit.selectedType == 'driv',
                      ),
                      UserSelectionOption(
                        title: 'منشأة (مطاعم ومتاجر)', 
                        desc: 'اذا كنت تمتلك مطعم أو متجر و تريد عرض منتجاتك', 
                        icon: Icons.storefront, 
                        onTap: () => cubit.changeSelectionUserType('fac'),
                        selected: cubit.selectedType == 'fac',
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        text: 'استمرار', 
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider.value(value: cubit, child: cubit.userSwitcher()))), 
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}

class UserSelectionOption extends StatelessWidget {
  final String title, desc;
  final bool selected;
  final VoidCallback onTap;
  final IconData icon;
  const UserSelectionOption({super.key, required this.title, required this.icon, required this.desc, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: selected ? Colors.blue : Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 30, color: selected ? Colors.blue : Theme.of(context).primaryColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 18, color: selected ? Colors.blue : Colors.black, fontWeight: FontWeight.bold)),
                    Text(
                      desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: ColorsManager.dark, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Icon(selected ? Icons.circle : Icons.circle_outlined, size: 20, color: selected ? Colors.blue : Colors.grey),
          ],
        ),
      ),
    );
  }
}