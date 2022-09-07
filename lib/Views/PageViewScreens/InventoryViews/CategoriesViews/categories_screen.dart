import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/BrandsModel.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/brands_card.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/CategoriesViews/add_new_category.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/CategoriesViews/category_card.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/categoriesModel.dart';
import '../../../Utils/Widgets/my_loading_indicator.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}


class _CategoriesScreenState extends State<CategoriesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

          showDialog(context: (context), builder: (context){
            return const AddNewCategory();
          });

        },
        icon: const Icon(Icons.add),
        label: const Text('Add Category'),
//        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Categories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No Categories found'),
              );
            } else {
              List<CategoriesModel> listOfBrands = [];

              for (var i = 0; i < snapshot.data!.docs.length; i++) {
                var data = snapshot.data!.docs[i];
                var json = {
                  'category_image': data['category_image'],
                  'category_description': data['category_description'],
                  'category_name': data['category_name'],
                  'created_date': data['created_date'],
                  'document_id': data.id
                };

                CategoriesModel model = CategoriesModel.fromJson(json);
                listOfBrands.add(model);
              }

              return GridView.builder(
                padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 20.sp),
                itemCount: listOfBrands.length,
                itemBuilder: (context, index) {
                  var data = listOfBrands[index];
                  return InkWell(
                      onTap: (){
                        CategoriesModel.model = data;

                        PageViewStatic.pageController.jumpToPage(6);

                      },
                      child: CategoryCard(data: data));
                },
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 10.sp,
                  mainAxisSpacing: 10.sp,
                ),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyLoadingIndicator();
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
