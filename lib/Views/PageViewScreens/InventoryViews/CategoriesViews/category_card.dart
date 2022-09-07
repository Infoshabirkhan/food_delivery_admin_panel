import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/app_colors.dart';
import 'package:food_delivery_admin_web/Models/categoriesModel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/BrandsModel.dart';
import '../BrandsViews/AddNewBrand/brands_static.dart';

class CategoryCard extends StatefulWidget {
  final CategoriesModel data;

  const CategoryCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  late TextEditingController brandController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    brandController = TextEditingController(text: widget.data.categoryName);
    descriptionController =
        TextEditingController(text: widget.data.categoryDescription);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//                  margin: EdgeInsets.only(left: ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        children: [
          Expanded(
            // flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.sp),
                  topRight: Radius.circular(15.sp),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.data.categoryImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 5.sp,
                right: 5.sp,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.data.categoryName,
                        style: GoogleFonts.roboto(fontSize: 18.sp),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.data.categoryDescription,
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp, color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: (context),
                                  builder: (context) {
                                    return Dialog(
                                      child: Container(
                                        padding: EdgeInsets.all(5.sp),
                                        height: 250.sp,
                                        width: 200.sp,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: ListView(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            'Update ${widget.data.categoryName}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: const Icon(
                                                              Icons.close,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    'Description',
                                                    style: GoogleFonts.roboto(),
                                                  ),
                                                  TextFormField(
                                                    controller: brandController,
//                                                initialValue: widget.data.brandName,
                                                    decoration:
                                                        const InputDecoration(
                                                            border:
                                                                OutlineInputBorder()),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    'Description',
                                                    style: GoogleFonts.roboto(),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        descriptionController,
                                                    decoration:
                                                        const InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  var json = {
                                                    'category_name':
                                                        brandController.text
                                                            .trim(),
                                                    'category_description':
                                                        descriptionController
                                                            .text
                                                            .trim()
                                                  };
                                                  FirebaseFirestore.instance
                                                      .collection('Categories')
                                                      .doc(widget
                                                          .data.documentId)
                                                      .update(json);

                                                  Navigator.of(context).pop();

                                                  BrandStatic.showToastMessage(
                                                      msg:
                                                          'Updated Successfully');
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors.kBlue),
                                                  margin: EdgeInsets.only(
                                                    left: 20.sp,
                                                    right: 20.sp,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Update',
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10.sp),
                              ),
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: (context),
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Confirmation!!!'),
                                      content:
                                          const Text('Are you sure to delete'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            FirebaseFirestore.instance
                                                .collection('Categories')
                                                .doc(widget.data.documentId)
                                                .delete();
                                            BrandStatic.showToastMessage(
                                                msg: 'Deleted Sucessfully');
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  10.sp,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Delete',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
