import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_values.dart';
import '../model/cart_product_model.dart';

class UserCartProduct extends StatelessWidget {
  final CartProductModel product;
  final VoidCallback increase, decrease;
  const UserCartProduct({super.key, required this.product, required this.increase, required this.decrease});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.3,
                child: Image.asset(product.img, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(product.description, maxLines: 4, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.pricing, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 8, end: 16, top: 4, bottom: 4),
                                child: InkWell(
                                  onTap: increase,
                                  child: const Icon(Icons.add, color: Colors.blue),
                                ),
                              ),
                              Text('${product.qty}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16, end: 8, top: 4, bottom: 4),
                                child: InkWell(
                                  onTap: decrease,
                                  child: const Icon(Icons.remove, size: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}