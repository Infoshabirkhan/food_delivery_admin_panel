import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/order_model.dart';
import 'menu_item.dart';

class OrderCardMobileView extends StatelessWidget {
  final OrderModel model;

  const OrderCardMobileView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.sp, right: 5.sp,),
      margin: EdgeInsets.only(bottom: 15.h),
      height: 150.h,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5.sp),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                          'ID#${model.clientId.substring(model.clientId.length - 5)}')),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomMenuButton(model: model)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        image: DecorationImage(
                          image: NetworkImage(model.productImage),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              model.pName,
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: 'Order by: \n',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.sp, color: Colors.grey[600]),
                                  children: [
                                    TextSpan(
                                        text: model.userName,
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 15.sp))
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.sp),
                                    color: model.orderStatus == "Pending"
                                        ? Colors.orange[300]
                                        : model.orderStatus == 'Accepted'
                                            ? Colors.greenAccent
                                            : model.orderStatus == "Rejected"
                                                ? Colors.redAccent
                                                : Colors.green,



                                  ),
                                  child: Center(child: Text(model.orderStatus, style:GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ) ,),),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Rs: ${model.price}',
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Qty: ${model.quantity}',
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp, color: Colors.grey[600]),
                            ),
                          ),
                        )
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
