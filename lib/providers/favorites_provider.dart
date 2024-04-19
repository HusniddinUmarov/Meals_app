
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meal.dart';
import 'package:meals_app/providers/meals_providers.dart';

import 'filters_provider.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal){
    final mealsFavorite = state.contains(meal);

    if(mealsFavorite){
      state = state.where((m) => m.id != meal.id ).toList();
      return false;
    }else{
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref){
  return FavoriteMealsNotifier();
});

final filteredMealsProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});