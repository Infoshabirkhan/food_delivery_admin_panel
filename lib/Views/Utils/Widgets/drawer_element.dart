import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Controllers/Cubits/drawer_pageview_cubit.dart';
import 'package:food_delivery_admin_web/Models/Utils/responsive.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Models/Utils/app_colors.dart';

class DrawerElement extends StatelessWidget {
  final String label;
  final IconData icon;
  final int jumpToIndex;

  const DrawerElement({
    Key? key,
    required this.icon,
    required this.label,
    required this.jumpToIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    print('==== > drawer width = $width');
    return BlocBuilder<DrawerPageviewCubit, int>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            PageViewStatic.pageController.jumpToPage(jumpToIndex);
            context.read<DrawerPageviewCubit>().getIndex(index: jumpToIndex);
            if(width < Responsive.tabletWidth){
              Navigator.of(context).pop();
            }
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 5.h, left: 5.w),
            padding: EdgeInsets.only(
              top: 5.h,
              bottom: 5.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
              color:
                  state == jumpToIndex ? Colors.grey[100] : Colors.transparent,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    color:
                        state == jumpToIndex ? AppColors.kBlue : Colors.white,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    label,
                    style: GoogleFonts.roboto(
                      color:  state == jumpToIndex ? AppColors.kBlue:Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
