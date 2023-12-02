import 'package:flutter/material.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/presentation/screens/meal_details.dart';
import 'package:meals_app/presentation/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    // required this.onToggleFavorite
  });
  final String? title;
  final List<MealModel> meals;
  // final void Function(MealModel meal) onToggleFavorite;

  void _selectMeals(BuildContext context, MealModel meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          //onToggleFavorite: onToggleFavorite,
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh ohh ... nothing here!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: meals[index],
            onMealSelected: () => _selectMeals(
              context,
              meals[index],
            ),
          );
        },
        itemCount: meals.length,
      );
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
