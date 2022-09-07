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

class AddNewBrandScreen extends StatefulWidget {
  const AddNewBrandScreen({Key? key}) : super(key: key);

  @override
  State<AddNewBrandScreen> createState() => _AddNewBrandScreenState();
}

class _AddNewBrandScreenState extends State<AddNewBrandScreen> {
  TextEditingController brandNameController = TextEditingController();
  TextEditingController brandDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8.sp),
        height: 350.sp,
        width: 300.sp,
        // child: ListView(
        //   children: [
        //     Expanded(child: Container(
        //       padding: EdgeInsets.only(left: 8.sp, right: 8.sp,),
        //       child: Column(
        //         children: [
        //           Expanded(child: Text('Please Fill the form', style: GoogleFonts.roboto(),),),
        //
        //           Expanded(child: PickImageCard(),),
        //           const Expanded(
        //             child: TextField(
        //               decoration: InputDecoration(
        //                 hintText: 'Brand Name',
        //                 border: OutlineInputBorder()
        //               ),
        //
        //             ),
        //           )
        //         ],
        //       ),
        //
        //     ),),
        //     Expanded(child: Container(
        //       child: Column(
        //         children: [
        //           Expanded(child: TextField(
        //             maxLines: 4,
        //             controller: brandDescriptionController,
        //             decoration: InputDecoration(
        //               hintText: 'Description',
        //               border: OutlineInputBorder()
        //             ),
        //           ),),
        //
        //
        //           Expanded(child: Container(
        //             color: Colors.red,
        //             child: Center(child: Text('Submit'),),
        //           ),),
        //         ],
        //       ),
        //     ),),
        //   ],
        // ),

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
                      child: const PickImageCard(myDestination: 'Brands',)),
                  SizedBox(height: 10.h,),
                  const RequiredTextHelperWidget(text: 'Brand Name'),
                   TextField(
                    controller: BrandStatic.brandNameController,
                    decoration: const InputDecoration(

                      hintText: 'Brand name',
                      border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(height: 10.sp,),
                 const RequiredTextHelperWidget(text: 'Description'),

                  TextField(
                    maxLines: 4,
                    controller: BrandStatic.brandDescriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Description', border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){

                  if(BrandStatic.validate() == true){
                    var brandName = BrandStatic.brandNameController.text.trim();
                    var json = {
                      'brand_name' : brandName,
                      'brand_description' : BrandStatic.brandDescriptionController.text.trim(),
                      'brand_image' : BrandStatic.imageUrl,
                      'created_date' : DateTime.now(),
                    };

                    var ref = FirebaseFirestore.instance.collection('Brands').doc(brandName);


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
