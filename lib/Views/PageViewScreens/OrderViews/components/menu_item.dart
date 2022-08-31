// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_admin_web/Models/Utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuButton extends StatelessWidget {
  final String orderStatus;

  const CustomMenuButton({
    Key? key,
    required this.orderStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (value) {
        print('=======> value $value');

        if (value == 'acceptOrder') {
        } else if (value == 'rejectOrder') {}
      },
      // onSelected: (value) =>
      //     showInSnackBar(localizations.demoMenuSelected(value)),
      itemBuilder: (context) => <PopupMenuEntry<String>>[
         orderStatus == "Pending" ? PopupMenuItem<String>(

          value: 'acceptOrder',
          child: MenuItems(
            label: 'Accept Order',
            iconData: CupertinoIcons.check_mark_circled,
          ),
        ) :
         PopupMenuItem<String>(

           value: 'remove',
           child: MenuItems(
             label: 'Remove',
             iconData: CupertinoIcons.delete,
           ),
         ),
        PopupMenuItem<String>(
          value: 'rejectOrder',
          child: ListTile(
            leading: Icon(
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
