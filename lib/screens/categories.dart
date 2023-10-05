import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/model/category.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/screens/meals.dart';
import 'package:mealapp/widgets/category_grid_item.dart';

class Categoriesscreen extends StatelessWidget {
  const Categoriesscreen({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;
  void _selectedcategory(BuildContext context, Category category) {

    final filteredmeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: category.title,
                  meals: filteredmeals,
                  onToggleFavorite: onToggleFavorite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onselectedcategory: () {
              _selectedcategory(context, category);
            },
          )
      ],
    );
  }
}
