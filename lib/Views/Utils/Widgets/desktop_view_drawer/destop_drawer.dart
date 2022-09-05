

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/drawer_element.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/app_colors.dart';

class DesktopDrawer extends StatelessWidget {
  const DesktopDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
       // width: 0.3.sw,
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
                children:  [

                  const DrawerElement(icon: Icons.home, label: 'Home' , jumpToIndex: 0,),
                  const DrawerElement(icon: Icons.history_rounded, label: 'View Orders' , jumpToIndex: 1,),


                  SizedBox(height: 15.h,),
                  Center(
                    child: Text('Inventory' , style: GoogleFonts.roboto(
                        color: Colors.white
                    ),),
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                 
                  const DrawerElement(icon: Icons.upload, label: 'Brands' , jumpToIndex: 3,),
                  const DrawerElement(icon: Icons.category, label: 'Categories' , jumpToIndex: 4,),

                  // ExpansionTile(
                  //
                  //   leading: Padding(
                  //     padding:  EdgeInsets.only(left: 8.w),
                  //     child: Icon(Icons.inventory, color: Colors.white,),
                  //
                  //   ),
                  //    collapsedIconColor: Colors.white,
                  //   iconColor: Colors.white,
                  //   title: Padding(
                  //     padding:  EdgeInsets.only(left:5.sp),
                  //     child: Text('Inventory'
                  //
                  //         ,style: GoogleFonts.roboto(color: Colors.white, fontSize: 14.sp),
                  //     ),
                  //   ),
                  // children:  const [
                  //
                  //
                  // ],),
                ],
              ),),
          ],
        ),
      ),
    );
  }
}
