import 'package:flutter/material.dart';
import 'package:mealapp/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onselectedcategory});
  final Category category;
  final void Function() onselectedcategory;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onselectedcategory,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.99),
            category.color.withOpacity(0.3)
          ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
