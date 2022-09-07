import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/BrandsModel.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/AddNewBrand/add_new_brand.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/brands_card.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';

import '../../../Utils/Widgets/my_loading_indicator.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}


class _BrandScreenState extends State<BrandScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){

          showDialog(context: (context), builder: (context){
            return const AddNewBrandScreen();
          });

          // PageViewStatic.pageController.jumpToPage(5);
        },
        icon: Icon(Icons.add),
        label: Text('Add Brand'),
//        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Brands').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData && !snapshot.hasError) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No brand found'),
              );
            } else {
              List<BrandsModel> listOfBrands = [];

              for (var i = 0; i < snapshot.data!.docs.length; i++) {
                var data = snapshot.data!.docs[i];
                var json = {
                  'brand_name': data['brand_name'],
                  'brand_description': data['brand_description'],
                  'brand_image': data['brand_image'],
                  'created_date': data['created_date'],
                  'document_id': data.id
                };

                BrandsModel model = BrandsModel.fromJson(json);
                listOfBrands.add(model);
              }

              return GridView.builder(
                padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 20.sp),
                itemCount: listOfBrands.length,
                itemBuilder: (context, index) {
                  var data = listOfBrands[index];
                  return InkWell(
                      onTap: (){
                        BrandsModel.model = data;

                        PageViewStatic.pageController.jumpToPage(5);

                      },
                      child: BrandsCard(data: data));
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
