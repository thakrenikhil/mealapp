import 'package:flutter/material.dart';
import 'package:mealapp/model/meal.dart';
import 'package:mealapp/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }
  String get AffordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
          onTap: () {onSelectMeal(meal);},
          child: Stack(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                                icon: Icons.schedule,
                                label: '${meal.duration} min'),
                            SizedBox(
                              width: 4,
                            ),
                            MealItemTrait(
                                icon: Icons.work_history,
                                label:'$complexityText'),
                            SizedBox(width: 4,),
                            MealItemTrait(
                                icon: Icons.attach_money,
                                label:'$AffordabilityText'),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
