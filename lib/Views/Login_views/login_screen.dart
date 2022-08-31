import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_admin_web/Views/Utils/Widgets/my_text_field.dart';
import 'package:food_delivery_admin_web/Views/PageViewScreens/dashboard_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/Utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstrait) {
          if (boxConstrait.maxWidth < 650) {
            return Container();
          } else {
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.kBlue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.sp),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.asset(
                            'assets/images/welcome.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.kBlue,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Spacer(),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: 5.sp,
                                    right: 5.sp,
                                  ),
                                  color: Colors.grey.withOpacity(0.3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    'Login',
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 8.sp,
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Please Provide your Credential to login',
                                                  style: GoogleFonts.roboto(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: MyTextField(
                                                icon: const Icon(Icons.person),
                                                controller: emailController,
                                                hintText:
                                                    'Please Enter Your Email',
                                              ),
                                            ),
                                            Expanded(
                                              child: MyTextField(
                                                icon: const Icon(Icons.lock),
                                                controller: passwordController,
                                                hintText: 'Password',
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  UserCredential
                                                      userCredential =
                                                      await FirebaseAuth
                                                          .instance
                                                          .signInWithEmailAndPassword(
                                                    email: emailController.text
                                                        .trim(),
                                                    password: passwordController
                                                        .text
                                                        .trim(),
                                                  );

                                                  if (userCredential.user !=
                                                      null) {
                                                    Navigator.of(context)
                                                        .pushReplacement(
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return DashboardScreen();
                                                        },
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    color: AppColors.kBlue,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Login',
                                                      style: GoogleFonts.roboto(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Don\'t have account ?  ',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black),
                                        children: [
                                          TextSpan(
                                              text: 'Create New',
                                              style: GoogleFonts.roboto(
                                                  color: AppColors.kBlue))
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
