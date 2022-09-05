import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/order_model.dart';

import '../../../../../../Models/Utils/app_colors.dart';
import 'delivery_information.dart';
import 'name_and_image_of_rider.dart';

class RiderInformationCard extends StatelessWidget {
  final bool? mobileView;
  final OrderModel model;

  const RiderInformationCard({
    Key? key,
    required this.model,
    this.mobileView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: model.riderName == '' ? false : true,
        child: Container(
          padding: EdgeInsets.all(15.sp),
          height: mobileView! ? 160.h : 80.h,
          decoration: BoxDecoration(
            color: AppColors.kLightBlack,
            borderRadius: BorderRadius.circular(
              10.sp,
            ),
          ),
          child: mobileView == true
              ? Column(
                  children: [
                    NameImageOfRider(model: model),
                    SizedBox(height: 5.h,),
                    DeliveryInformation(model: model),
                  ],
                )
              : Row(
                  children: [
                    NameImageOfRider(model: model),
                    DeliveryInformation(model: model),
                  ],
                ),
        ));
  }
}
