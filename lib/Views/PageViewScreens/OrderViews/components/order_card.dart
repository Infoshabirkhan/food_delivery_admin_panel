import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/order_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/app_colors.dart';
import 'menu_item.dart';

class OrderCard extends StatelessWidget {
  final Color cardColor;
  final OrderModel? model;
  final bool? heading;

  const OrderCard(
      {Key? key, this.model, this.heading = true, required this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      color: cardColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              //alignment: heading! ?Alignment.centerLeft : Alignment.center,
              alignment: Alignment.center,
              child: SelectableText(
                model != null
                    ? '#${model!.clientId.substring(model!.clientId.length - 5)}'
                    : 'CustomerID#',
                style: GoogleFonts.roboto(
                  fontWeight: heading! ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                model != null ? model!.pName : 'Product Name',
                style: GoogleFonts.roboto(
                  fontWeight: heading! ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                model != null ? model!.userName : 'Customer Name',
                style: GoogleFonts.roboto(
                  fontWeight: heading! ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                model != null ? model!.address : 'Location',
                style: GoogleFonts.roboto(
                  fontWeight: heading! ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                model != null ? 'Rs: ${model!.price}' : 'Amount',
                style: GoogleFonts.roboto(
                  fontWeight: heading! ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: heading! ? double.infinity : 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: heading!
                          ? Colors.transparent
                          : model!.orderStatus == "Pending"
                              ? AppColors.kLightOrange
                              : AppColors.kLightGreen,
                    ),
                    alignment:
                        heading! ? Alignment.centerLeft : Alignment.center,
                    child: SelectableText(
                      model != null ? model!.orderStatus : 'Order Status',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          color: heading!
                              ? Colors.black
                              : model!.orderStatus == "Pending"
                                  ? AppColors.kOrange
                                  : AppColors.kGreen),
                    ),
                  ),
                ),
                heading!
                    ? const Spacer()
                    : Expanded(
                        child: CustomMenuButton(
                          orderStatus: model!.orderStatus,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
