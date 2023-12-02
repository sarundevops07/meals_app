import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meals_model.dart';

class FavoriteMealNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealNotifier() : super([]);
  bool toggleMealFavoriteStatus(MealModel meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      // this will filter all meals expect the same id meal and added as  new list
      return false;
    } else {
      state = [...state, meal];
      // ...state this is spread operator and it will pull out the existing list and combine another list
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<MealModel>>((ref) {
  return FavoriteMealNotifier();
});
