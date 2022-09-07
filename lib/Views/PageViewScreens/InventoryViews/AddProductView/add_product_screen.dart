import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Controllers/Cubits/product_image_cubit.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/AddNewBrand/brands_static.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/pick_image_widget.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/required_text_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/responsive.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductImageCubit(''),
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  10.sp,
                  20.sp,
                  10.sp,
                  20.sp,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(100),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.only(
                    left: 20.sp,
                    right: 20.sp,
                    top: 10.sp,
                    bottom: 10.sp,
                  ),
                  children: [
                    Text(
                      'Add Product Form',
                      style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      height: 25.h,
                    ),
                    RequiredTextHelperWidget(
                      text: 'Product Name',
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Product name....'),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: RequiredTextHelperWidget(
                            text: 'Quantity',
                          ),
                        ),
                        SizedBox(
                          width: 30.sp,
                        ),
                        const Expanded(
                          child: RequiredTextHelperWidget(
                            text: 'Price',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Quantity...'),
                          ),
                        ),
                        SizedBox(
                          width: 30.sp,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Price in rupees....'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RequiredTextHelperWidget(text: 'Description'),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Message....'),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const PickImageCard(myDestination: 'Products'),

                    SizedBox(                      height: 25.h,
                    ),
                    Visibility(
                      visible: width < Responsive.mobileWidth ? true : false,
                      child: const SubmitButton(),),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: width < Responsive.mobileWidth ? false : true,

              child: Expanded(

                child: Container(
                  margin: EdgeInsets.fromLTRB(
                    10.sp,
                    20.sp,
                    10.sp,
                    20.sp,
                  ),
                  padding: EdgeInsets.only(
                    left: 20.sp,
                    right: 20.sp,
                    top: 10.sp,
                    bottom: 10.sp,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(100),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ListView(
                    children: [
                      Text(
                        'Product',
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp, fontWeight: FontWeight.w700),
                      ),
                      Divider(),
                      BlocBuilder<ProductImageCubit, String>(
                        builder: (context, state) {
                          return Container(
                            height: 400,
                            width: 1.sw,
                            child: state == ''
                                ? Image.asset('assets/images/no_image.png')
                                : Image.network(BrandStatic.imageUrl),
                          );
                        },
                      ),
                      Visibility(
                          visible: width < Responsive.mobileWidth ? false : true,
                          child: const SubmitButton(),),
                    ],
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
class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                     Container(
      margin: EdgeInsets.only(
        left: 20.sp,
        right: 20.sp,
      ),
      height: 40.h,
      color: Colors.black,
      child: Center(
        child: Text(
          'Submit',
          style: GoogleFonts.roboto(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
