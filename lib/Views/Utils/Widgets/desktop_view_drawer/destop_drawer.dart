

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/drawer_element.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/app_colors.dart';

class DesktopDrawer extends StatelessWidget {
  const DesktopDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.3.sw,
      color: AppColors.kBlue,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Admin Panel',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            ),
          ),

          Expanded(

            flex: 6,
            child: ListView(
              children: [

                DrawerElement(icon: Icons.home, label: 'Home' , jumpToIndex: 0,),
                DrawerElement(icon: Icons.history_rounded, label: 'View Orders' , jumpToIndex: 1,),
              ],
            ),),
        ],
      ),
    );
  }
}
