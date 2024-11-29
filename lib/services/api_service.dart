
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meals_category_model.dart';

class ApiService {
  final String apiUrl = 'http://54.170.183.211/api/v1/get-mealcategories';

  Future<MealsCategoryModel> fetchMealsCategory(String langId) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {'lang_id': langId},
    );

    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        return MealsCategoryModel.fromJson(json.decode(response.body));
      } catch (e) {
        throw Exception('Error parsing response: $e');
      }
    } else {
      throw Exception('Failed to load meal categories');
    }
  }
}
