import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/responsive.dart';
import 'package:food_delivery_admin_web/Models/order_model.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/Order%20Detail%20View/Responsive%20layout/order_detail_large.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/Order%20Detail%20View/Responsive%20layout/order_detail_tablet_view.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/Order%20Detail%20View/Responsive%20layout/rider_information_card/rider_informaition_card.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/app_colors.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderModel model = OrderModel.model!;

  @override
  Widget build(BuildContext context) {
    //var price = int.parse(model.price);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstrait) {
          debugPrint('=====> boxcontrant ${boxConstrait.maxWidth}');
          if (boxConstrait.maxWidth > Responsive.tabletWidth) {
            // for web large view
            return OrderDetialLarge(model: model);
          } else if (boxConstrait.maxWidth < Responsive.tabletWidth &&
              boxConstrait.maxWidth > Responsive.mobileWidth) {
            /// for tablet view ========================== ////
            return OrderDetailTabletView(model: model);
          } else {
            return  OrderDetailTabletView(model: model);
          }
        },
      ),
    );
  }
}
