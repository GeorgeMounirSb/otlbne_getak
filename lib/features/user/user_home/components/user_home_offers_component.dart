import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_values.dart';
import '../model/user_home_offers_model.dart';

class UserHomeOffersComponent extends StatelessWidget {
  final UserHomeOffersModel offer;
  const UserHomeOffersComponent({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.44,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(offer.img),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  offer.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Text(
                    offer.rate,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                offer.currentPrice,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                offer.oldPrice,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}