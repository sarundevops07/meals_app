import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/presentation/widgets/filter_switch_list_tile.dart';
import 'package:meals_app/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterSwitchListTile(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals.',
              value: activeFilter[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref.read(
                  filterProvider.notifier.select(
                    (value) => value.setFilter(Filter.glutenFree, isChecked),
                  ),
                );
              }),
          FilterSwitchListTile(
              title: 'Lactos-free',
              subtitle: 'Only include lactos-free meals.',
              value: activeFilter[Filter.lactosFree]!,
              onChanged: (isChecked) {
                ref.read(
                  filterProvider.notifier.select(
                    (value) => value.setFilter(Filter.lactosFree, isChecked),
                  ),
                );
              }),
          FilterSwitchListTile(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
              value: activeFilter[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(
                  filterProvider.notifier.select(
                    (value) => value.setFilter(Filter.vegetarian, isChecked),
                  ),
                );
              }),
          FilterSwitchListTile(
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
              value: activeFilter[Filter.vegan]!,
              onChanged: (isChecked) {
                ref.read(
                  filterProvider.notifier.select(
                    (value) => value.setFilter(Filter.vegan, isChecked),
                  ),
                );
              })
        ],
      ),
    );
  }
}
