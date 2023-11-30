import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meals_model.dart';
import 'package:meals_app/presentation/screens/categories.dart';
import 'package:meals_app/presentation/screens/filters_screen.dart';
import 'package:meals_app/presentation/screens/meals.dart';
import 'package:meals_app/presentation/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactosFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _selectedIndex = 0;
  final List<MealModel> favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;
  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void toggleMealFavoriteStatus(MealModel meal) {
    final isExisting = favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        favoriteMeals.remove(meal);
        _showInfoMessage('Favorite Removed');
      });
    } else {
      setState(() {
        favoriteMeals.add(meal);
        _showInfoMessage('Favorite Added');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(DrawerItems identifier) async {
    Navigator.pop(context);
    if (DrawerItems.filters == identifier) {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters),
        ),
      );

      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      onToggleFavorite: toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activeScreenTitle = 'Categories';

    if (_selectedIndex == 1) {
      activeScreen = MealsScreen(
        meals: favoriteMeals,
        onToggleFavorite: toggleMealFavoriteStatus,
      );
      activeScreenTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
