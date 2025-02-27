import 'package:flutter/material.dart';

class AppbarCenterTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppbarCenterTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}