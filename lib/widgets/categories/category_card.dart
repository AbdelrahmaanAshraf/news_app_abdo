import 'package:flutter/material.dart';
import 'package:news_app_abdo/models/category_model.dart';
import 'package:news_app_abdo/services/navigation/navigate.dart';
import 'package:news_app_abdo/view/category_view.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.categoryModel});

  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryView.id,arguments: categoryModel);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 190,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(categoryModel.image)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: Text(
          categoryModel.categoryName,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
