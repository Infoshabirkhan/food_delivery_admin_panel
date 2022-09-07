import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RequiredTextHelperWidget extends StatelessWidget {
  final double? fontSize;
  final String text;
  const RequiredTextHelperWidget({Key? key, required this.text, this.fontSize = 14}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RichText(text: TextSpan(
        text: text,
        style: GoogleFonts.roboto(color: Colors.black, fontSize: fontSize!.sp),
        children: [
          TextSpan(text: ' *',style: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.w600),),
        ]
    ),);
  }
}
