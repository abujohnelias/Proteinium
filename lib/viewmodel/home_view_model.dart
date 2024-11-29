// lib/viewmodels/home_view_model.dart
import 'package:flutter/material.dart';
import '../models/meals_category_model.dart';
import '../services/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MealsCategoryModel? _mealsCategoryModel;
  MealsCategoryModel? get mealsCategoryModel => _mealsCategoryModel;

  HomeViewModel() {
    fetchMealsCategories();
  }

  // Inside HomeViewModel's fetchMealsCategories method
Future<void> fetchMealsCategories() async {
  _isLoading = true;
  notifyListeners();

  try {
    _mealsCategoryModel = await _apiService.fetchMealsCategory('en');
    print('Meal categories: ${_mealsCategoryModel?.data.mealCategories.first.name}');
  } catch (e) {
    print('Error fetching meals category: $e');
  }

  _isLoading = false;
  notifyListeners();
}

}
