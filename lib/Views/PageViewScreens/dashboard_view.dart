import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/app_colors.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/HomeScreenViews/home_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/orders_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/Widgets/desktop_view_drawer/destop_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: DesktopDrawer(),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                children: [
                  Expanded(child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withAlpha(100), blurRadius: 10,),
                      ]

                    ),
                  ),),
                  Expanded(

                    flex: 6,
                    child: Container(color: Colors.grey[100],

                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: PageViewStatic.pageController,
                      children: [

                        HomeScreen(),
                        OrdersScreen(),
                      ],
                    ),

                    ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
