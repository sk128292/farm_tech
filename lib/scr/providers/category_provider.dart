import 'package:farm_tech/scr/models/category_model.dart';
import 'package:farm_tech/scr/services/category_services.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  CategoryServices _categoryServices = CategoryServices();
  List<CategoryModel> categories = [];

  CategoryProvider.initialize() {
    loadCategories();
  }

  loadCategories() async {
    categories = await _categoryServices.getCategories();
    notifyListeners();
  }
}
