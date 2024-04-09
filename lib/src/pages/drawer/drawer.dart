import 'package:flutter/material.dart';
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
            child: SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text("98XXXXXXXX"),
                              Text("johnd109@gmail.com")
                            ]))
                      ])),
                  FixedGaps.verticalGap10,
                  AppWidgetHelper.decoratedContainer(context,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Material(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const Text("ACCOUNT",
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                            const Text("SETTINGS",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            FixedGaps.verticalGap10,
                            _options(
                                onTap: () {},
                                icon: Icons.notifications,
                                text: "Notifications"),
                            const Divider(color: Colors.black12),
                            _options(
                                onTap: () {},
                                icon: Icons.language_rounded,
                                text: "Language"),
                            const Divider(color: Colors.black12),
                            _options(
                                onTap: () {},
                                icon: Icons.security_rounded,
                                text: "Permissions"),
                          ]))),
                  // HELP & LEGAL
                  FixedGaps.verticalGap20,
                  AppWidgetHelper.decoratedContainer(context,
                      padding: const EdgeInsets.all(10),
                      child: Material(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            const Text("HELP & LEGAL",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            FixedGaps.verticalGap10,
                            _options(
                                onTap: () {},
                                icon: Icons.contact_emergency,
                                text: "Emergecy Support"),
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
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const LoginScreen();
                                        }));
                                      },
                                      question:
                                          "Are you sure you want to log out?");
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
                                    const Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [Text("Log Out")]))
                                  ]),
                                ))
                          ]))),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Image.asset("assets/images/facebook.png",
                                    height: 30, width: 30)),
                            FixedGaps.horizontalGap20,
                            InkWell(
                                onTap: () {},
                                child: Image.asset(
                                    "assets/images/instagram.png",
                                    height: 30,
                                    width: 30)),
                            FixedGaps.horizontalGap20,
                            InkWell(
                                onTap: () {},
                                child: Image.asset("assets/images/twitter.png",
                                    height: 30, width: 30))
                          ])),
                  const Text("Version 1.0.0")
                ]))));
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
                      children: [Text(text)]))
            ])));
  }
}
