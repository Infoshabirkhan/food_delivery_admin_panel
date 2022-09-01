import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Models/Utils/app_colors.dart';

class RidersDialog extends StatelessWidget {

  final VoidCallback onPressed;
  const RidersDialog({
    Key? key,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      return Center(
                        child: Text('No Riders Found'),
                      );
                    } else {
                      return ListView.builder(
                          padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var rider = snapshot.data!.docs[index];
                            return InkWell(
                              onTap: onPressed,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 8.sp),
                                height: 70.h,
                                color: AppColors.kGrey,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    rider['name'],
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15.sp),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    rider['address'],
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 15.sp),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
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
  }
}
