import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;

  const CustomDatePicker({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 217.w,
        height: 43.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Row(
          children: [

            Expanded(
              flex: 4,
              child: TextFormField(

                enabled: false,
                controller: controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  border: InputBorder.none,
                  hintText: 'dd/mm/yyyy',
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  var picked = await showDatePicker(
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                            data: ThemeData(
                              primarySwatch: Colors.grey,
                              splashColor: Colors.blue,
                              textTheme: TextTheme(
                                subtitle1: const TextStyle(color: Colors.black),
                                button: TextStyle(color: Colors.blue),
                              ),
                              accentColor: Colors.black,
                              colorScheme: ColorScheme.light(
                                primary: Colors.blue,
                              ),
                              dialogBackgroundColor: Colors.white,
                            ),
                            child: child!);
                      },
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2016),
                      lastDate: DateTime(2101),
                      context: (context));

                  if (picked != null) {
                    controller.text = picked.toString().split(' ')[0];
                  }
                },
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.blue[400],
                ),
              ),
            )
          ],
        ),
      ),
    );
    // return                 Row(
    //   children: [
    //
    //     Expanded(
    //
    //         child: Container(
    //           padding: EdgeInsets.only(left: 10.w),
    //           decoration: BoxDecoration(
    //             border: Border.all(color: AppColors.grey),
    //             borderRadius: BorderRadius.circular(4.r)
    //           ),
    //           child: Row(
    //             children: [
    //               Expanded(
    //                 flex: 2,
    //                 child: Align(
    //                   alignment: Alignment.center,
    //                   child: TextFormField(
    //
    //                     enabled: false,
    //                     controller: controller,
    //                     decoration: InputDecoration(
    //
    //                       border: InputBorder.none,
    //
    //                         hintText: 'dd/mm/yyyy',
    //
    //
    //
    //                     ),
    //
    //
    //
    //                   ),
    //                 ),
    //               ),
    //               Expanded(child: InkWell(
    //                   onTap: () async{
    //                     var picked =  await showDatePicker(
    //                         initialDate: DateTime.now(),
    //                         firstDate: DateTime.now(),
    //                         lastDate: DateTime(2101), context: (context));
    //
    //
    //                     if(picked != null){
    //                       controller.text = picked.toString().split(' ')[0];
    //
    //                     }
    //
    //                   },
    //                   child:  Icon(AppIcons.calendar, color: AppColors.meduimBlue,)))
    //             ],
    //           ),
    //         )),
    //     const Spacer(),
    //   ],
    // );
  }
}
