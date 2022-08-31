import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/components/order_card.dart';

import '../../../Models/Utils/app_colors.dart';
import '../../../Models/order_model.dart';
import '../../Utils/Widgets/custom_date_picker.dart';

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
          left: 5.w,
          right: 5.w,
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
                          color: AppColors.kGrey.withOpacity(0.1)
                        ),
                        borderRadius: BorderRadius.circular(20.sp),

                      ),enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.kGrey.withOpacity(0.1)
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
                      Expanded(child: CustomDatePicker(controller: dateController,)),
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
                            "user_name": data['user_name']
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
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
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
