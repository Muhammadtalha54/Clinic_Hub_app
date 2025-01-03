import 'package:clinic_hub_app/apptheme/Apptheme.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextfocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus);
  }

  // static Toastmessage(String message) {
  //   Fluttertoast.showToast(
  //       msg: message,
  //       backgroundColor: Appcolor.YellowColor,
  //       gravity: ToastGravity.CENTER_RIGHT,
  //       textColor: Appcolor.TextColor);
  // }
// this snackbar is defined once and will be used after wards where needed
  static snackbar(String title, String message) {
    Get.snackbar(title, message,
        backgroundColor: Apptheme.mainbackgroundcolor.withOpacity(0.3),
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(seconds: 3));
  }
}
