import 'package:flutter/material.dart';
import 'package:food_delivery_admin_web/Models/categoriesModel.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';

class CategoryWiseDetailScreen extends StatefulWidget {
  const CategoryWiseDetailScreen({Key? key}) : super(key: key);

  @override
  State<CategoryWiseDetailScreen> createState() => _CategoryWiseDetailScreenState();
}

class _CategoryWiseDetailScreenState extends State<CategoryWiseDetailScreen> {


  CategoriesModel model = CategoriesModel.model!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
      onPressed: () {



        PageViewStatic.pageController.jumpToPage(7);


      },
      label: Text('Add Product'),
      icon: Icon(Icons.add),
    ));
  }
}
