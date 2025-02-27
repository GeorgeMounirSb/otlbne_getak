import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/widgets/custom_text_form_feild.dart';
import '../../search/view/search_screen.dart';

class UserHomeScreenBarComponent extends StatelessWidget {
  final String img, name;
  final bool showCart, showSearch;
  final VoidCallback activeLocation;
  final VoidCallback? openCart;
  const UserHomeScreenBarComponent({super.key, required this.img, required this.name, required this.activeLocation, required this.showCart, this.openCart, this.showSearch = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(img, width: 35, height: 35, fit: BoxFit.cover),
                  const SizedBox(width: 6),
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  if(showCart) InkWell(
                    onTap: openCart,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(color: HexColor('#34B1DD'), shape: BoxShape.circle),
                      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 24),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: activeLocation,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(color: HexColor('#34B1DD'), shape: BoxShape.circle),
                      child: const Icon(Icons.location_on_outlined, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if(showSearch)
          ...[
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'أبحت عن ما تريد هنا',
              preffixIcon: const Icon(Icons.search),
              readOnly: true,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen())),
            ),
          ],
        ],
      ),
    );
  }
}