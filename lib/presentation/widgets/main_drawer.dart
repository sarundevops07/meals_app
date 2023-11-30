import 'package:flutter/material.dart';
import 'package:meals_app/presentation/widgets/drawer_list_tile.dart';

enum DrawerItems { meals, filters }

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(DrawerItems identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          DrawerListTile(
            icon: Icons.restaurant,
            title: 'Meals',
            onTap: () {
              onSelectScreen(DrawerItems.meals);
            },
          ),
          DrawerListTile(
            icon: Icons.settings,
            title: 'Filters',
            onTap: () {
              onSelectScreen(DrawerItems.filters);
            },
          )
        ],
      ),
    );
  }
}
