import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';

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
            leading: leading ??
                Container(
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    height: 40,
                    width: 40,
                    child: const Icon(Icons.person, color: Colors.white)),
            title: title ??
                Text("Hi, John",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        letterSpacing: -.5)),
            subtitle: subtitle,
            trailing: showSetting!
                ? Container(
                    decoration: BoxDecoration(
                        color: MediaQuery.platformBrightnessOf(context).name ==
                                "light"
                            ? Colors.black12
                            : Colors.grey.shade800,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    height: 40,
                    width: 40,
                    child: Icon(Icons.settings,
                        color: MediaQuery.platformBrightnessOf(context).name ==
                                "light"
                            ? Colors.black54
                            : Colors.grey))
                : null));
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
