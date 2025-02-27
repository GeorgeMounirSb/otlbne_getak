import 'package:flutter/material.dart';

import '../../user_components/title_text_component.dart';

class UserHomeMainCategoriesComponent<T> extends StatelessWidget {
  final String title;
  final AlignmentGeometry alignment;
  final List<T> items;
  final Widget Function(T) itemBuilder;
  final bool Function(T)? filterCondition;

  const UserHomeMainCategoriesComponent({
    super.key,
    required this.title,
    this.alignment = AlignmentDirectional.centerStart,
    required this.items,
    required this.itemBuilder,
    this.filterCondition,
  });

  @override
  Widget build(BuildContext context) {
    // Apply filter condition if provided, otherwise use all items
    final filteredItems = filterCondition != null ? items.where(filterCondition!).toList() : items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        TitleTextComponent(title: title, alignment: alignment),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: filteredItems.map(itemBuilder).toList(),
          ),
        ),
      ],
    );
  }
}
