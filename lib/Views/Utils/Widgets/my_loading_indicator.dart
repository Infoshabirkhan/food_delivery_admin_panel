import 'package:flutter/material.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // width: 100.sp,
        // height: 100.sp,
        child: Center(
          //loading_circular_indicator.gif
          child: Image.asset('assets/images/spinning.gif'),
        ),
      ),
    );
  }
}
