import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String path;
  const ImagePreview({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Preview')),
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: Center(
          child: Image.network(
            path,
            errorBuilder: (context, error, stackTrace) {
              return const Text('Failed to load image.');
            },
          ),
        ),
      ),
    );
  }
}