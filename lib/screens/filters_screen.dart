import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: MainDrawer(onSelectScreen: (identifier){
        Navigator.of(context).pop();
        if(identifier == 'meals'){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> TabsScreen()));
        }
      },),
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked){
               ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                'Gluten- free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include gluten",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                'Lactose- free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include lactose",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                'Vegetarian- free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                'Vegen- free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                "Only include Vegen",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
    );
  }
}
