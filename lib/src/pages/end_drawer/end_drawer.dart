import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/pages/services/checkout/checkout.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({super.key});

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        width: 200,
        child: SingleChildScrollView(
            child: Column(children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              decoration: const BoxDecoration(color: primaryColor),
              child: Row(children: [
                if (BlocProvider.of<AuthenticationCubit>(context)
                    is AuthenticationUnAuthenticated) ...{
                  const CircleAvatar(
                      child: Icon(Icons.person, color: Colors.black87)),
                  FixedGaps.horizontalGap5,
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("login".tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("toAccessFeature".tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ]))
                } else ...{
                  const Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("Hi, John",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text("Navbar",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ]))
                }
              ])),
          Stack(clipBehavior: Clip.none, children: [
            if (selectedIndex == 1)
              Positioned(
                  right: -40,
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 10,
                                color: primaryColor)
                          ]))),
            ListTile(
                onTap: () {
                  setState(() => selectedIndex = 1);
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const ChekoutScreen()));
                },
                leading: const Icon(Icons.shopping_cart_outlined, size: 20),
                title: const Text("Cart"))
          ]),
          Stack(clipBehavior: Clip.none, children: [
            if (selectedIndex == 2)
              Positioned(
                  right: -40,
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                blurRadius: 10,
                                color: primaryColor)
                          ]))),
            ListTile(
                onTap: () {
                  setState(() => selectedIndex = 2);
                },
                leading:
                    const Icon(Icons.notifications_active_outlined, size: 20),
                title: Text("Notifications".tr()))
          ]),
          FixedGaps.verticalGap100,
          FixedGaps.verticalGap50,
          const Divider(color: Colors.black12),
          Column(children: [
            ListTile(
                onTap: () {},
                leading: const Icon(Icons.app_settings_alt_outlined, size: 20),
                title: Text("Settings".tr())),
            ListTile(
                onTap: () {},
                leading: const Icon(Icons.feedback_outlined, size: 20),
                title: Text("Report".tr())),
            ListTile(
                onTap: () {},
                leading: const Icon(Icons.help_outline_rounded, size: 20),
                title: Text("Help".tr()))
          ])
        ])));
  }
}
