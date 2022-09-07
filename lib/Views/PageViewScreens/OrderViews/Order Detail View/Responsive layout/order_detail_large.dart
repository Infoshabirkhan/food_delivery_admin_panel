import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/order_model.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/Order%20Detail%20View/Responsive%20layout/rider_information_card/rider_informaition_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../static_properties.dart';

class OrderDetialLarge extends StatelessWidget {
  final OrderModel model;

  const OrderDetialLarge({
    Key? key,
    required this.model,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var price = int.parse(model.price);

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: ListView(
            padding:  EdgeInsets.only(
              left: 10.sp,
              right: 10.sp,
            ),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {
                    PageViewStatic.pageController.jumpToPage(1);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.orange,
                  ),
                  label: Text(
                    'Back',
                    style: GoogleFonts.roboto(
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Order ID # ${model.orderId}',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp

                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              RichText(
                text: TextSpan(
                  text: 'Orders / ',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 13.sp

                  ),
                  children: [
                    TextSpan(
                      text: 'Orders Detail',
                      style: GoogleFonts.roboto(
                          color: Colors.grey[600],
                          fontSize: 13.sp

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),




              Container(
                height: 150.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withAlpha(100),
                          blurRadius: 10
                      ),
                    ]
                ),
                child: Center(child: Image.asset('assets/images/trackorder.jpg'),),
              ),
              SizedBox(
                height: 20.h,
              ),




              RiderInformationCard(model: model),

              SizedBox(height: 20.h,),






              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha(100),
                      blurRadius: 10,
                    ),
                  ],
                ),
                padding:  EdgeInsets.only(
                  left: 10.sp,
                  right: 10.sp,
                ),
                height: 180.h,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Item',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp

                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Qty',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Price',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp

                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Total Price',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp

                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          model.productImage,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        10.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Main Course',
                                            style: GoogleFonts.roboto(
                                                color: Colors.red,
                                                fontSize: 11.sp
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topLeft,

                                          child: Text(

                                            model.pName,
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp

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
                          Expanded(
                            child: Text(
                              '${model.quantity}x',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp

                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Rs: ${model.price}',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Rs: ${model.quantity * price}',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp

                              ),
                            ),
                          ),
                          const Expanded(
                            child: Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin:    EdgeInsets.only(right: 10.sp),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(
                        15.sp,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        model.orderStatus,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withAlpha(100),
                        blurRadius: 10,
                      ),
                    ], color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(model.userImage),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,

                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          model.userName,
                                          style: GoogleFonts.roboto(
                                              fontSize: 12.sp
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Expanded(child: Align(
                                    //   alignment: Alignment.bottomLeft,
                                    //   child: Text(model.address, style: GoogleFonts.roboto(
                                    //
                                    //   ),),
                                    // ),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Icon(Icons.phone),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(model.userMobileNo, style: GoogleFonts.roboto(
                                          fontSize: 12.sp

                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Icon(CupertinoIcons.location),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(model.address, style: GoogleFonts.roboto(
                                          fontSize: 12.sp

                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Description',
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    model.productDescription,
                                    style: GoogleFonts.roboto(
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    // color: Colors.blue,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
