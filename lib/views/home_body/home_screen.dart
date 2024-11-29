import 'package:flutter/material.dart';
import 'package:proteinium/resources/color_const.dart';
import 'package:proteinium/viewmodel/home_view_model.dart';
import 'package:proteinium/views/home_body/widgets/meal_category_card.dart';
import 'package:proteinium/views/home_body/widgets/meals_plan_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> expandedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background,
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.mealsCategoryModel == null) {
            return const Center(child: Text('No meal categories available.'));
          }

          var categories = viewModel.mealsCategoryModel!.data.mealCategories;

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              var category = categories[index];
              bool isExpanded = expandedIndices.contains(index);

              return Column(
                children: [
                  MealCategoryCard(
                    category: category,
                    isExpanded: isExpanded,
                    onPressed: () {
                      setState(() {
                        if (isExpanded) {
                          expandedIndices.remove(index);
                        } else {
                          expandedIndices.add(index);
                        }
                      });
                    },
                  ),
                  if (isExpanded && category.mealPlans != null)
                    MealPlanList(mealPlans: category.mealPlans!),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

