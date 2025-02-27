import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_form_feild.dart';
import '../components/search_component.dart';
import '../components/suggest_search_component.dart';
import '../view_model/cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit(),
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              var cubit = SearchCubit.get(context);
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'أبحت عن ما تريد هنا',
                      controller: cubit.searchController,
                      preffixIcon: const Icon(Icons.search),
                      focusNode: cubit.searchFocus,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: cubit.closeAndClearSearch,
                      ),
                      onChanged: (val) => cubit.filterItems(),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: cubit.suggestions.map((e) => SuggestSearchComponent(
                        onTap: () => cubit.selectSuggest(e),
                        suggest: e,
                      )).toList(),
                    ),
                    const SizedBox(height: 24),
                    Expanded(
                      child: ListView.builder(
                        itemCount: cubit.searchResults.length,
                        itemBuilder: (context, index) {
                          var result = cubit.searchResults[index];
                          return SearchComponent(
                            title: result.title,
                            img: result.img,
                            description: result.description,
                            pricing: result.pricing,
                            onTap: () {},
                            rate: Row(
                              children: [
                                Text(result.rate.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}