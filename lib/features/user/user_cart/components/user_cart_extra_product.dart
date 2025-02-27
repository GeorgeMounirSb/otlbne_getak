import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_values.dart';
import '../model/cart_product_model.dart';

class UserCartExtraProduct extends StatelessWidget {
  final CartProductModel product;
  const UserCartExtraProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width * 0.3,
            height: context.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Image.asset(product.img, fit: BoxFit.scaleDown),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  product.title,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '(${product.description})',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(product.pricing),
        ],
      ),
    );
  }
}