import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../Models/Utils/app_colors.dart';
import '../../../../../../Models/order_model.dart';

class DeliveryInformation extends StatelessWidget {
  final OrderModel model;
  const DeliveryInformation({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(

              margin: EdgeInsets.only(right: 10.sp),
              decoration: BoxDecoration(
                color: AppColors.kDarkGrey,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
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
                              'Mobile No:',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              model.riderMobile,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12.sp,
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
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColors.kDarkGrey,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(
                      Icons.timer,
                      color: Colors.white,
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
                              'Delivery Time',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '3:30',
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 12.sp,
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
