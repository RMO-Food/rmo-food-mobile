import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rmo_food/config/routes_imports.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/full_button.dart';

class AppWidgetHelper {
  static Widget decoratedContainer(BuildContext context,
      {required Widget child,
      Alignment? alignment,
      double? height,
      double? width,
      Color? color,
      EdgeInsets? padding,
      EdgeInsets? margin,
      double? borderRadius,
      DecorationImage? image,
      Border? border}) {
    return Container(
        alignment: alignment,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            image: image,
            border: border,
            color: color ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 2),
            boxShadow: [
              BoxShadow(
                  color:
                      MediaQuery.platformBrightnessOf(context).name == "light"
                          ? Colors.grey.shade300
                          : Colors.black54,
                  blurRadius: 5)
            ]),
        width: width,
        height: height,
        child: child);
  }

  static void bottomSheet(
      {required BuildContext context,
      required String message,
      String? btnName}) async {
    showModalBottomSheet(
        context: context,
        shape: const BeveledRectangleBorder(),
        builder: (context) {
          return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(message),
                    FixedGaps.verticalGap10,
                    FullButton(
                        onPressed: () => Navigator.pop(context),
                        btnName: btnName ?? "OK")
                  ]));
        });
  }

  static void showLoginDialog({required BuildContext context}) async {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 60),
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SvgPicture.asset("assets/icons/splash.svg",
                        height: 70, width: 70, color: primaryColor),
                    const Text(
                        "Oops! You may require authentication to continue.",
                        textAlign: TextAlign.center),
                    FixedGaps.verticalGap10,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  shape: const BeveledRectangleBorder(),
                                  padding: EdgeInsets.zero),
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel",
                                  style: TextStyle(color: Colors.red))),
                          TextButton(
                              style: TextButton.styleFrom(
                                  shape: const BeveledRectangleBorder(),
                                  padding: EdgeInsets.zero),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, Routes.loginScreen);
                              },
                              child: const Text("Login",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)))
                        ])
                  ])));
        });
  }

  static Future<bool> confirmationDialog(
      {required BuildContext context,
      Function()? onCancel,
      Function()? onConfirm,
      required String question}) async {
    bool confirm = false;
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 60),
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SvgPicture.asset("assets/icons/splash.svg",
                        height: 70, width: 70, color: primaryColor),
                    Text(question, textAlign: TextAlign.center),
                    FixedGaps.verticalGap10,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      width: .5, color: primaryColor),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2))),
                                  padding: EdgeInsets.zero),
                              onPressed: onCancel ??
                                  () {
                                    confirm = false;
                                    Navigator.pop(context);
                                  },
                              child: const Text("No",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: "Lexend",
                                      fontWeight: FontWeight.bold))),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.red.shade900,
                                  side: BorderSide(
                                      width: .5, color: Colors.red.shade900),
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2))),
                                  padding: EdgeInsets.zero),
                              onPressed: onConfirm ??
                                  () {
                                    confirm = true;
                                    Navigator.of(context).pop(true);
                                  },
                              child: const Text("Yes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Lexend",
                                      fontWeight: FontWeight.bold)))
                        ])
                  ])));
        });
    return confirm;
  }
}
