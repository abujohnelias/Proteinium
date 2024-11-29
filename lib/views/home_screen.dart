import 'package:flutter/material.dart';
import 'package:proteinium/resources/color_const.dart';
import 'package:proteinium/resources/text_style_const.dart';
import 'package:proteinium/viewmodel/home_view_model.dart';
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
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        color: ColorConst.background,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
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
                                  image: NetworkImage(
                                    category.image,
                                  ),
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
                          onPressed: () {
                            setState(() {
                              if (isExpanded) {
                                expandedIndices.remove(index);
                              } else {
                                expandedIndices.add(index);
                              }
                            });
                          },
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
                  ),
                  if (isExpanded && category.mealPlans != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        color: ColorConst.surface,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: category.mealPlans?.length,
                          itemBuilder: (context, mealIndex) {
                            var mealPlan = category.mealPlans?[mealIndex];
                            return ListTile(
                              leading: const Icon(
                                Icons.fastfood_outlined,
                                color: ColorConst.accentRed,
                              ),
                              title: Text(
                                mealPlan!.name,
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
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
