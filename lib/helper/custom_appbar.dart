import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/src/pages/bottom_nav/bottom_nav.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? showSetting;
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  const CustomAppBar(
      {super.key,
      this.showSetting = true,
      this.title,
      this.subtitle,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: ListTile(
            contentPadding: const EdgeInsets.only(top: 20, bottom: 10),
            leading: SizedBox(
                width: 40,
                height: 40,
                child: InkWell(
                  onTap: () {
                    scaffoldKey?.currentState?.openDrawer();
                    // if (BlocProvider.of<AuthenticationCubit>(context).state
                    //     is AuthenticationAuthenticated) {
                    //   scaffoldKey?.currentState?.openDrawer();
                    // } else {
                    //   AppWidgetHelper.showLoginDialog(context: context);
                    // }
                  },
                  child: leading ??
                      const DecoratedBox(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Icon(Icons.person, color: Colors.white)),
                )),
            title: title ??
                const Text("Hi, John",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            subtitle: subtitle,
            trailing: showSetting!
                ? SizedBox(
                    height: 40,
                    width: 40,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color:
                                MediaQuery.platformBrightnessOf(context).name ==
                                        "light"
                                    ? Colors.black12
                                    : Colors.grey.shade800,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Icon(Icons.settings,
                            color:
                                MediaQuery.platformBrightnessOf(context).name ==
                                        "light"
                                    ? Colors.black54
                                    : Colors.grey)),
                  )
                : const SizedBox(width: 40)));
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
