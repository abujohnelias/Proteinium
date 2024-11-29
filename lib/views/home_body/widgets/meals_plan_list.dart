
import 'package:flutter/material.dart';
import 'package:proteinium/resources/color_const.dart';
import 'package:proteinium/resources/text_style_const.dart';

class MealPlanList extends StatelessWidget {
  final List<dynamic> mealPlans;

  const MealPlanList({
    required this.mealPlans,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        color: ColorConst.surface,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mealPlans.length,
          itemBuilder: (context, mealIndex) {
            var mealPlan = mealPlans[mealIndex];
            return ListTile(
              leading: const Icon(
                Icons.fastfood_outlined,
                color: ColorConst.accentRed,
              ),
              title: Text(
                mealPlan.name,
                style: TextStyleConst.poppinsMedium14.copyWith(
                  color: ColorConst.textPrimary,
                ),
              ),
              subtitle: Text(
                mealPlan.shortDescription,
                style: TextStyleConst.poppinsRegular12.copyWith(
                  color: ColorConst.primary,
                ),
              ),
              isThreeLine: true,
            );
          },
        ),
      ),
    );
  }
}
