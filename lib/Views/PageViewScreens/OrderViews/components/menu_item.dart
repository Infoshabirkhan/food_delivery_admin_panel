import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Models/Utils/app_colors.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/OrderViews/components/riders_dialog.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/static_properties.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/order_model.dart';
import '../Order Detail View/order_detail_screen.dart';

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
        print('=======> value $value');

        if (value == 'acceptOrder') {
          showDialog(
              context: context,
              builder: (context) {
                return RidersDialog(
                  onPressed: (){
                    data.update({
                      "order_status": "Deliver",
                    });

                    userHistory.update({
                      "order_status": "Completed",
                    });
                    Navigator.of(context).pop();

                  },
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
