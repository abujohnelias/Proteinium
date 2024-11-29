
class MealsCategoryModel {
  bool status;
  int code;
  int blocked;
  Data data;
  String message;

  MealsCategoryModel({
    required this.status,
    required this.code,
    required this.blocked,
    required this.data,
    required this.message,
  });

  factory MealsCategoryModel.fromJson(Map<String, dynamic> json) {
    return MealsCategoryModel(
      status: json['status'],
      code: json['code'],
      blocked: json['blocked'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class Data {
  List<Banner> banners;
  int notificationCount;
  List<Banner> mealCategories;

  Data({
    required this.banners,
    required this.notificationCount,
    required this.mealCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var bannersList = json['banners'] as List? ?? [];
    var categoriesList = json['meal_categories'] as List? ?? [];
    return Data(
      banners: bannersList.map((e) => Banner.fromJson(e)).toList(),
      notificationCount: json['notification_count'] ?? 0,
      mealCategories: categoriesList.map((e) => Banner.fromJson(e)).toList(),
    );
  }
}

class Banner {
  int id;
  String name;
  String image;
  List<MealPlan>? mealPlans;

  Banner({
    required this.id,
    required this.name,
    required this.image,
    this.mealPlans,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    var mealPlansList = json['meal_plans'] as List? ?? [];
    return Banner(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      mealPlans: mealPlansList.map((e) => MealPlan.fromJson(e)).toList(),
    );
  }
}

class MealPlan {
  int id;
  String name;
  String mealTypes;
  String shortDescription;

  MealPlan({
    required this.id,
    required this.name,
    required this.mealTypes,
    required this.shortDescription,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    return MealPlan(
      id: json['id'],
      name: json['name'],
      mealTypes: json['meal_types'],
      shortDescription: json['short_description'],
    );
  }
}
