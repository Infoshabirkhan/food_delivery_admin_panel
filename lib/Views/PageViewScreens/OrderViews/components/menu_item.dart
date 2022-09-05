import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/app_colors.dart';
import 'package:food_delivery_admin_web/Models/Utils/rider_model.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/components/riders_dialog.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/order_model.dart';
import '../../../Utils/Widgets/my_loading_indicator.dart';

class CustomMenuButton extends StatelessWidget {
  final OrderModel model;

  const CustomMenuButton({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (value) {
        var data =
            FirebaseFirestore.instance.collection('Orders').doc(model.orderId);
        var userHistory = FirebaseFirestore.instance
            .collection('Users')
            .doc(model.clientId)
            .collection("OrderHistory")
            .doc(model.documentId);
        debugPrint('=======> value $value');

        if (value == 'acceptOrder') {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    width: 0.3.sw,
                    height: 0.5.sh,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Please Select a Rider',
                                style: GoogleFonts.roboto(),
                              )),
                        ),
                        Expanded(
                          flex: 5,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('DeliveryRider')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData && !snapshot.hasError) {
                                if (snapshot.data!.docs.isEmpty) {
                                  return const Center(
                                    child: Text('No Riders Found'),
                                  );
                                } else {
                                  List<RiderModel> listOfRiders = [];

                                  for (var i = 0;
                                      i < snapshot.data!.docs.length;
                                      i++) {
                                    var data = snapshot.data!.docs[i];
                                    var json = {
                                      'rider_address': data['rider_address'],
                                      'rider_image': data['rider_image'],
                                      'rider_phone': data['rider_phone'],
                                      'rider_name': data['rider_name']
                                    };

                                    RiderModel model =
                                        RiderModel.fromJson(json);
                                    listOfRiders.add(model);
                                  }

                                  return ListView.builder(
                                      padding: EdgeInsets.only(
                                        left: 20.sp,
                                        right: 20.sp,
                                      ),
                                      itemCount: listOfRiders.length,
                                      itemBuilder: (context, index) {
                                        var rider = listOfRiders[index];
                                        return RidersCard(
                                            model: rider,
                                            onPressed: () {
                                              var json = {
                                                "order_status": "Accepted",
                                                "rider_address": rider.riderAddress,
                                                "rider_image": rider.riderImage,
                                                "rider_phone": rider.riderMobile,
                                                "rider_name": rider.riderName
                                              };

                                              data.update(json);
                                              userHistory.update(json);
                                              Navigator.of(context).pop();
                                            });
                                      });
                                }
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const MyLoadingIndicator();
                              } else {
                                return const Center(
                                  child: Text('Something went wrong'),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else if (value == 'rejectOrder') {
          data.update({
            "order_status": "Rejected",
          });

          userHistory.update({
            "order_status": "Rejected",
          });
        } else if (value == "viewDetail") {
          OrderModel.model = model;
          PageViewStatic.pageController.jumpToPage(2);
        } else {
          data.delete();
        }
      },
      // onSelected: (value) =>
      //     showInSnackBar(localizations.demoMenuSelected(value)),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'viewDetail',
          child: ListTile(
            leading: const Icon(
              Icons.visibility,
            ),
            title: Text(
              'View',
              style: GoogleFonts.roboto(),
            ),
          ),
        ),
        model.orderStatus == "Pending"
            ? const PopupMenuItem<String>(
                value: 'acceptOrder',
                child: MenuItems(
                  label: 'Accept Order',
                  iconData: CupertinoIcons.check_mark_circled,
                ),
              )
            : const PopupMenuItem<String>(
                value: 'remove',
                child: MenuItems(
                  label: 'Remove',
                  iconData: CupertinoIcons.delete,
                ),
              ),
        PopupMenuItem<String>(
          value: 'rejectOrder',
          child: ListTile(
            leading: const Icon(
              Icons.close,
            ),
            title: Text(
              'Reject Order',
              style: GoogleFonts.roboto(),
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItems extends StatelessWidget {
  final String label;
  final IconData iconData;

  const MenuItems({
    Key? key,
    required this.iconData,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: AppColors.kBlue,
      ),
      title: Text(
        label,
        style: GoogleFonts.roboto(color: AppColors.kBlue),
      ),
    );
  }
}
