import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/responsive.dart';
import 'package:food_delivery_admin_web/Models/order_model.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/Order%20Detail%20View/Responsive%20layout/order_detail_large.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/app_colors.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderModel model = OrderModel.model!;

  @override
  Widget build(BuildContext context) {
    var price = int.parse(model.price);
    return Scaffold(body: LayoutBuilder(
      builder: (context, boxConstrait) {
        print('=====> boxcontrant ${boxConstrait.maxWidth}');
        if (boxConstrait.maxWidth > Responsive.tabletWidth) {
          // for web large view
          return OrderDetialLarge(model: model);
        } else if (boxConstrait.maxWidth < Responsive.tabletWidth &&
            boxConstrait.maxWidth > Responsive.mobileWidth) {
          return Container(
            child: ListView(
              padding: EdgeInsets.only(
                left: 20.sp,
                right: 20.sp,
              ),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      PageViewStatic.pageController.jumpToPage(1);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                  ),
                ),
                SizedBox(height: 10.h,),
                SelectableText(
                  'Order Id # ${model.orderId}',
                  style: GoogleFonts.roboto(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),

                ),
                SizedBox(height: 10.h,),


                Container(

                  padding: EdgeInsets.only(left: 10.sp),
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withAlpha(100), blurRadius: 10,),
                    ],


                  ),
                  child: Column(
                    children: [
                      Expanded(child: Row(
                        children: [
                          Expanded(child: Row(children: [

                            Expanded(child:Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(model.userImage)
                                )
                              ),
                            ),),

                            Expanded(
                              flex: 2,
                              child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(model.userName, style: GoogleFonts.roboto(

                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp
                              ),),
                            ),),


                          ],),),
                          Expanded(child: Row(children: [

                            Expanded(child: Icon(Icons.phone),),
                            Expanded(
                              flex: 2,
                              child: Text(model.userMobileNo,style: GoogleFonts.roboto(
                              fontSize: 15.sp ,
                               fontWeight: FontWeight.w600
                            ),),),

                          ],),),

                        ],
                      ),),


                      Divider(),
                      Expanded(child: Container(
                        width: 1.sw,
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                          Expanded(child: Text('Address',style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp
                          ),),),
                          Expanded(child: Text(model.address,style: GoogleFonts.roboto(
                            fontSize: 15.sp
                          ),),),

                        ],),
                      ),),
                    ],
                  ),
                ),



                SizedBox(height: 20.h,),


                Container(

                  padding: EdgeInsets.all(15.sp),
                  height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.kLightBlack,

                  borderRadius: BorderRadius.circular(10.sp,),
                ),

                  child: Row(
                    children: [
                      Expanded(child: Container(
                        child: Row(
                          children: [
                            Expanded(child: Container(

                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle
                              ),
                            ),),
                            Expanded(
                              flex: 2,
                              child: Text('RiderName', style: GoogleFonts.cairo(

                                color: Colors.white,


                              fontSize: 15.sp,
                            ),),),
                          ],
                        ),
                      ),),
                      Expanded(child: Container(


                        child: Row(
                          children: [
                            Expanded(child: Container(

                              // chng







                              margin: EdgeInsets.only(right: 10.sp),
                            decoration: BoxDecoration(
                              color: AppColors.kDarkGrey,
                              borderRadius: BorderRadius.circular(10.sp),

                            ),
                            child: Row(
                              children: [
                                Expanded(child: Icon(Icons.phone, color: Colors.white,),),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                  children: [

                                    Expanded(child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Mobile No:', style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 12.sp
                                      ),),
                                    ),),
                                    Expanded(child: Align(
                                      alignment: Alignment.topLeft,

                                      child: Text('03109898989', style: GoogleFonts.roboto(
                                          color: Colors.white,

                                          fontSize: 12.sp
                                      ),),
                                    ),),
                                  ],
                                ),),
                              ],
                            ),

                            ),),
                            Expanded(child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: AppColors.kDarkGrey,
                              ),

                              child: Row(
                                children: [
                                  Expanded(child: Icon(Icons.phone, color: Colors.white,),),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [

                                        Expanded(child: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Text('Mobile No:', style: GoogleFonts.roboto(
                                              color: Colors.white,

                                              fontSize: 12.sp
                                          ),),
                                        ),),
                                        Expanded(child: Align(
                                          alignment: Alignment.topLeft,

                                          child: Text('03109898989', style: GoogleFonts.roboto(
                                              color: Colors.white,

                                              fontSize: 12.sp
                                          ),),
                                        ),),
                                      ],
                                    ),),
                                ],
                              ),

                            ),),
                          ],
                        ),
                      ),),
                    ],
                  ),


                ),


              ],
            ),
          );
        } else {
          return Container(
            child: Center(
              child: Text('mobile'),
            ),
          );
        }
      },
    ));
  }
}
