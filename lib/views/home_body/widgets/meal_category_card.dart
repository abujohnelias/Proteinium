
import 'package:flutter/material.dart';
import 'package:proteinium/resources/color_const.dart';
import 'package:proteinium/resources/text_style_const.dart';

class MealCategoryCard extends StatelessWidget {
  final dynamic category;
  final bool isExpanded;
  final VoidCallback onPressed;

  const MealCategoryCard({
    required this.category,
    required this.isExpanded,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          color: ColorConst.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(category.image),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    color: ColorConst.shadowDark,
                    child: Text(
                      category.name,
                      style: TextStyleConst.poppinsMedium16
                          .copyWith(color: ColorConst.surface),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(8),
            ),
            child: Icon(
              isExpanded
                  ? Icons.arrow_drop_up_rounded
                  : Icons.arrow_drop_down_rounded,
              color: ColorConst.primary,
            ),
          ),
        ),
      ],
    );
  }
}