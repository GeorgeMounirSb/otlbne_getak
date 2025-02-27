import 'package:flutter/material.dart';

import '../model/user_home_categories_model.dart';

class UserHomeCategoriesComponent extends StatelessWidget {
  final UserHomeCategoriesModel cat;
  const UserHomeCategoriesComponent({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Image.asset(cat.img),
          const SizedBox(height: 8),
          Text(cat.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ]
      ),
    );
  }
}