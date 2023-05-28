import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsprovider/providers/favourites_provider.dart';
import 'package:mealsprovider/providers/filters_provider.dart';
//import 'package:mealsprovider/providers/meals_providers.dart';
import 'package:mealsprovider/screens/categories.dart';
import 'package:mealsprovider/screens/filters.dart';
import 'package:mealsprovider/screens/meals.dart';

import '../widgets/main_drawer.dart';

//Map<Filter, bool>
// const kInitialFilters = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // Map<Filter, bool> _selectedFilters = {
  //   Filter.glutenFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.vegetarian: false,
  //   Filter.vegan: false,
  // };
//  Map<Filter, bool> _selectedFilters = kInitialFilters;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (context) {
          return const FiltersScreen(
              // currentFilters: _selectedFilters,
              );
        }),
      );

      // setState(() {
      //   _selectedFilters = result ?? kInitialFilters;
      // });
    }
  }

  String activePageTitle = 'Categories';
  @override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filteredMealsProvider);
    // final availableMeals =
    // meals.where((meal) {
    //   if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilters[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();

    Widget activePage = CategoriesScreen(
      availableMeals: activeFilters,
      //  onToggleFavorite: _toggleMealFavoriteStatus,
    );
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
        //  onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        drawer: MainDrawer(
          onSelectScreen: _setScreen,
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            onTap: _selectPage,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.set_meal), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.start), label: 'Favourites'),
            ]));
  }
}
