import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/rider_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/app_colors.dart';

class RidersCard extends StatelessWidget {
  final RiderModel model;

  final VoidCallback onPressed;
  const RidersCard({
    required this.model,
    Key? key,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.sp),
        height: 70.h,
        color: AppColors.kGrey,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(model.riderImage)
                  )
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment:
                        Alignment.centerLeft,
                        child: Text(
                          model.riderName,
                          style: GoogleFonts.roboto(
                              fontSize: 15.sp),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          model.riderAddress,
                          style: GoogleFonts.roboto(
                              fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
