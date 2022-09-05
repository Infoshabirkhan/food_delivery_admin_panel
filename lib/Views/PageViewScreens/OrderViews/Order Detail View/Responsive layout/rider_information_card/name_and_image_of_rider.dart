import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../Models/order_model.dart';

class NameImageOfRider extends StatelessWidget {
  final OrderModel model;
  const NameImageOfRider({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 30.sp,
              backgroundImage: NetworkImage(model.riderImage),
            ),
            // child: Container(
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey),
            //       // color: Colors.red,
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           fit: BoxFit.fitWidth,
            //           image: NetworkImage(
            //               model.riderImage))),
            // ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //  flex: 2,
                  child: Text(
                    'Delivery Guy',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: Text(
                    model.riderName,
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
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
