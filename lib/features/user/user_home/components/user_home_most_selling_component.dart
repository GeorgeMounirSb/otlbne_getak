import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_values.dart';
import '../model/user_home_most_selling_model.dart';

class UserHomeMostSellingComponent extends StatelessWidget {
  final UserHomeMostSellingModel product;
  const UserHomeMostSellingComponent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.44,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(product.img),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    product.rate,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                ],
              ),
              const SizedBox(width: 8),
              Text(
                '(${product.reviews})',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}