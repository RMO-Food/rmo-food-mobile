import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rmo_food/config/routes_imports.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/authentication/login.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const AppBackButton(),
            title: const Text("Account Settings")),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Column(children: [
              // Profile
              AppWidgetHelper.decoratedContainer(context,
                  padding: const EdgeInsets.all(12),
                  child: const Row(children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: primaryColor,
                        child: Icon(Icons.person, color: Colors.white)),
                    FixedGaps.horizontalGap10,
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text("John",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text("98XXXXXXXX"),
                          Text("johnd109@gmail.com")
                        ]))
                  ])),
              FixedGaps.verticalGap10,
              AppWidgetHelper.decoratedContainer(context,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Material(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("acc".tr(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        FixedGaps.verticalGap10,
                        InkWell(
                            onTap: () {},
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  CircleAvatar(
                                      backgroundColor: primaryColor,
                                      radius: 13,
                                      child: Icon(Icons.person_3_rounded,
                                          color: Colors.white, size: 20)),
                                  FixedGaps.horizontalGap10,
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [Text("Profile")]))
                                ])))
                      ]))),
              // Settings
              FixedGaps.verticalGap20,
              AppWidgetHelper.decoratedContainer(context,
                  padding: const EdgeInsets.all(10),
                  child: Material(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("SETTINGS".tr(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        FixedGaps.verticalGap10,
                        _options(
                            onTap: () {},
                            icon: Icons.notifications,
                            text: "Notifications"),
                        const Divider(color: Colors.black12),
                        _options(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const BeveledRectangleBorder(),
                                  builder: (context) {
                                    return Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    context.setLocale(
                                                        const Locale(
                                                            'ne', 'NE'));
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                                "Nepali"),
                                                            if (context
                                                                    .locale ==
                                                                const Locale(
                                                                    'ne', 'NE'))
                                                              const Icon(
                                                                  Icons.check,
                                                                  size: 20)
                                                          ]))),
                                              InkWell(
                                                  onTap: () {
                                                    context.setLocale(
                                                        const Locale(
                                                            'en', 'US'));
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                                "English"),
                                                            if (context
                                                                    .locale ==
                                                                const Locale(
                                                                    'en', 'US'))
                                                              const Icon(
                                                                  Icons.check,
                                                                  size: 20)
                                                          ])))
                                            ]));
                                  });
                            },
                            icon: Icons.language_rounded,
                            text: "Language"),
                        const Divider(color: Colors.black12),
                        _options(
                            onTap: () {},
                            icon: Icons.security_rounded,
                            text: "Permissions")
                      ]))),
              // HELP & LEGAL
              FixedGaps.verticalGap20,
              AppWidgetHelper.decoratedContainer(context,
                  padding: const EdgeInsets.all(10),
                  child: Material(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("helpNLegal".tr(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        FixedGaps.verticalGap10,
                        _options(
                            onTap: () => Navigator.pushNamed(
                                context, Routes.helpAndSupport),
                            icon: Icons.contact_emergency,
                            text: "helpNSupp"),
                        const Divider(color: Colors.black12),
                        _options(
                            onTap: () {},
                            icon: Icons.policy_sharp,
                            text: "Policies")
                      ]))),
              // LOG OUT
              FixedGaps.verticalGap20,
              AppWidgetHelper.decoratedContainer(context,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Material(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        InkWell(
                            onTap: () {
                              AppWidgetHelper.confirmationDialog(
                                  context: context,
                                  onConfirm: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const LoginScreen();
                                    }));
                                  },
                                  question: "logoutquestion");
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Row(children: [
                                  Transform.rotate(
                                      angle: 3.14,
                                      child: const Icon(Icons.logout,
                                          color: primaryColor)),
                                  FixedGaps.horizontalGap10,
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [Text("logout".tr())]))
                                ])))
                      ]))),
              // Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 10.0),
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           InkWell(
              //               onTap: () {},
              //               child: Image.asset("assets/images/facebook.png",
              //                   height: 30, width: 30)),
              //           FixedGaps.horizontalGap20,
              //           InkWell(
              //               onTap: () {},
              //               child: Image.asset(
              //                   "assets/images/instagram.png",
              //                   height: 30,
              //                   width: 30)),
              //           FixedGaps.horizontalGap20,
              //           InkWell(
              //               onTap: () {},
              //               child: Image.asset("assets/images/twitter.png",
              //                   height: 30, width: 30))
              //         ])),
              const Spacer(),
              const Text("Version 1.0.0")
            ])));
  }

  Widget _options(
      {required Function() onTap,
      required IconData icon,
      required String text}) {
    return InkWell(
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [
              Icon(icon, color: primaryColor),
              FixedGaps.horizontalGap10,
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(text.tr())]))
            ])));
  }
}
