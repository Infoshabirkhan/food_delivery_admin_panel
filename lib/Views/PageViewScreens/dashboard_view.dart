import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Controllers/Cubits/drawer_pageview_cubit.dart';
import 'package:food_delivery_admin_web/Models/Utils/responsive.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/HomeScreenViews/home_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/AddProductView/add_product_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/AddNewBrand/add_new_brand.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/BrandsViews/brands_views.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/CategoriesViews/categories_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/InventoryViews/CategoriesViews/category_wise_detail_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/Order%20Detail%20View/order_detail_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/orders_screen.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/Widgets/desktop_view_drawer/destop_drawer.dart';
import 'InventoryViews/BrandsViews/brand_wise_products.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> titles = [
    'Dashboard',
    'Orders',
    'Customers',
    'Brands',
    'Categories',
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Responsive.changingWidth = width;
    print('width ==========> $width');
    print(Responsive.visibleOnTablets);
    print(' =====> ${Responsive.changingWidth}');

    return Scaffold(
      drawer: DesktopDrawer(),
      body: Row(
        children: [
          Visibility(
            visible: width >= Responsive.tabletWidth ? true : false,
            child: Expanded(
              child: DesktopDrawer(),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(100),
                          blurRadius: 10,
                        ),
                      ]),
                      child: BlocBuilder<DrawerPageviewCubit, int>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: width >= Responsive.tabletWidth
                                          ? false
                                          : true,
                                      child: Expanded(
                                        child: IconButton(
                                            onPressed: () {
                                              Scaffold.of(context).openDrawer();
                                            },
                                            icon: Icon(Icons.menu)),
                                      ),
                                    ),
                                    Expanded(
                                      flex: width < Responsive.mobileWidth ? 2: 3,


//                                      flex: 3,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 8.sp,
                                        ),
                                        child: Text(
                                          titles[state],
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                     Spacer(
                                     // flex: width > Responsive.tabletWidth  ?2 :1,
                                    flex: width > Responsive.tabletWidth  ?2 :1,


                                     ),
                                    Expanded(
                                      flex: width < Responsive.mobileWidth ? 2: 1,

                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,

                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment: Alignment
                                                        .bottomLeft,
                                                    child: Text(
                                                      'Hello',
                                                      style:
                                                          GoogleFonts.roboto(
                                                              color: Colors
                                                                  .grey[600],
                                                              fontSize:
                                                                  12.sp,),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Shabir khan',
                                                      style: GoogleFonts
                                                          .roboto(

                                                        fontSize: 15.sp
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 50.h,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: Colors.grey[100],
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: PageViewStatic.pageController,
                        children: const [
                          HomeScreen(),           // 0
                          OrdersScreen(),         // 1
                          OrderDetailScreen(),   //  2
                          BrandScreen(),         //  3
                          CategoriesScreen() ,    //  4
                          BrandWiseProduct(),    // 5
                          CategoryWiseDetailScreen(),  // 6
                          AddProductScreen()          // 7

                        ],
                      ),
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
