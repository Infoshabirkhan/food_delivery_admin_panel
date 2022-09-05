import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Controllers/Cubits/drawer_pageview_cubit.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/dashboard_view.dart';

import 'Views/Login_views/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();



  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB75sFXOEfeKpLUkDgr6HuiX9u5lc7lUpg",
      appId: "1:88141800442:web:3840da804b1ace124a3a43",
      messagingSenderId: "88141800442",
      projectId: "delivery-299a0",
      storageBucket: "delivery-299a0.appspot.com",

    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) =>
          BlocProvider(
            create: (context) => DrawerPageviewCubit(0),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Admin Dashboard',
              theme: ThemeData(

                primarySwatch: Colors.blue,
              ),
              home: DashboardScreen(),
            ),
          ),
      minTextAdapt:true,
    );
  }
}
