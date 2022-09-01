

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive{


  static double mobileWidth = 511;


  static double mediumText = changingWidth > tabletWidth ? 15.sp : 15;
  
  static double smallText =  changingWidth > tabletWidth ? 11.sp : 11;
  static double largeText =  changingWidth > tabletWidth ? 18.sp : 18;
  
  static var changingWidth;
  static double tabletWidth = 824;


  static bool  visibleOnTablets = Responsive.changingWidth > Responsive.tabletWidth ? true  :false;


}





