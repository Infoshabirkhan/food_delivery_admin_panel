import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/app_colors.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/AddNewBrand/brands_static.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/pick_image_widget.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/required_text_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({Key? key}) : super(key: key);

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8.sp),
        height: 350.sp,
        width: 300.sp,

        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ListView(
                children: [

                  Row(
                    children: [
                      Expanded(

                        flex: 2,
                        child:                   Align(
                          alignment: Alignment.centerRight,
                          child: Text(

                            'Please Fill the form',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 17.sp
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.clear)),
                      ),),
                    ],
                  ),
                  Container(

                      height: 50.h,
                      child: const PickImageCard(myDestination: 'Categories',)),
                  SizedBox(height: 10.h,),
                  const RequiredTextHelperWidget(text: 'Category Name'),
                  TextField(
                    controller: BrandStatic.brandNameController,
                    decoration: const InputDecoration(

                        hintText: 'Enter Category name...',
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                  const RequiredTextHelperWidget(text: 'Description'),

                  TextField(
                    maxLines: 4,
                    controller: BrandStatic.brandDescriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Type here..', border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){

                  if(BrandStatic.validate() == true){
                    var cateogoryName = BrandStatic.brandNameController.text.trim();
                    var json = {
                      'category_name' : cateogoryName,
                      'category_description' : BrandStatic.brandDescriptionController.text.trim(),
                      'category_image' : BrandStatic.imageUrl,
                      'created_date' : DateTime.now(),
                    };

                    var ref = FirebaseFirestore.instance.collection('Categories').doc();


                    ref.set(json);

                    BrandStatic.clearAllFields();
                    Navigator.of(context).pop();


                  }

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.kBlue,


                      borderRadius: BorderRadius.circular(20.sp)
                  ),
                  margin: EdgeInsets.only(
                    left: 20.sp,
                    right: 20.sp,
                  ),
                  child: Center(
                    child: Text('Submit', style: GoogleFonts.roboto(color: Colors.white),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
