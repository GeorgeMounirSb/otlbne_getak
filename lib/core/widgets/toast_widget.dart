import 'package:flutter/material.dart';

import '../../main.dart';

class ToastWidget {
  showToast(context, {String message = 'حدث خطأ ما'}) {
    if (!context.mounted) return;
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}