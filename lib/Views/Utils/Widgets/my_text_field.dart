import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final Icon icon;

  const MyTextField({
    Key? key,
    required this.icon,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10.sp),
          border: const OutlineInputBorder(),
          prefixIcon: Container(
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.grey)),
            ),
            child: icon,
          ),
          hintText: hintText,),
    );
  }
}
