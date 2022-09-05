import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/components/order_card.dart';

import '../../../Models/Utils/app_colors.dart';
import '../../../Models/order_model.dart';
import '../../Utils/Widgets/custom_date_picker.dart';
import '../../Utils/Widgets/my_loading_indicator.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  TextEditingController dateController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 10.sp,
          right: 10.sp,
        ),        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [

                  Expanded(child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search here',
                      border: OutlineInputBorder(

                        borderSide: BorderSide(
                          color: AppColors.kGrey.withOpacity(0.5)
                        ),
                        borderRadius: BorderRadius.circular(20.sp),

                      ),enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.kGrey.withOpacity(0.5)
                        ),
                        borderRadius: BorderRadius.circular(20.sp),

                      ),

                      filled: true,
                       fillColor: AppColors.kGrey
                    ),
                  ),),

                  Spacer(
                    flex: 2,
                  ),
                  Expanded(child: Row(
                    children: [
                      Expanded(

                          flex: 2,
                          child: CustomDatePicker(controller: dateController,)),
                      Spacer(),
                    ],
                  ),),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('Orders').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && !snapshot.hasError) {
                      if (snapshot.data!.docs.isEmpty) {
                        return const Center(
                          child: Text('No Orders found'),
                        );
                      } else {
                        List<OrderModel> listOfOrders = [];

                        for (var i = 0; i < snapshot.data!.docs.length; i++) {
                          var data = snapshot.data!.docs[i];
                          var json = {
                            "address": data['address'],
                            "client_id": data['client_id'],
                            "date_time": data['date_time'],
                            "document_id": data['document_id'],
                            "order_status": data['order_status'],
                            "p_name": data['p_name'],
                            "price": data['price'],
                            "product_description": data['product_description'],
                            "product_image": data['product_image'],
                            "quantity": data['quantity'],
                            "user_image": data['user_image'],
                            "user_mobile_no": data['user_mobile_no'],
                            "user_name": data['user_name'],
                            "order_id" : data.id,
                            "rider_address" : data['rider_address'],
                            "rider_image" : data['rider_image'],
                            "rider_phone" : data['rider_phone'],
                            "rider_name" : data['rider_name']
                          };
                          OrderModel model = OrderModel.fromJson(json);
                          listOfOrders.add(model);
                        }

                        return Column(
                          children: [
                            const Expanded(
                              child: OrderCard(
                                cardColor: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: ListView.builder(
                                  itemCount: listOfOrders.length,
                                  itemBuilder: (context, index) {
                                    var data = listOfOrders[index];

                                    return OrderCard(
                                      cardColor: index % 2 == 1
                                          ? Colors.white
                                          : AppColors.kGrey,
                                      model: data,
                                      heading: false,
                                    );
                                  }),
                            ),
                          ],
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return  const MyLoadingIndicator();
                    } else {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
