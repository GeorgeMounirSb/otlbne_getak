import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_values.dart';

class SearchComponent extends StatelessWidget {
  final String img, title, description, pricing;
  final Widget? rate;
  final VoidCallback? onTap;
  const SearchComponent({super.key, required this.img, required this.title, required this.description, required this.pricing, this.rate, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Image.asset(img, width: context.width * 0.35),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      Text(description, maxLines: 4, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
                      if(rate != null)
                      ...[
                        const SizedBox(width: 8),
                        rate!,
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(pricing, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}