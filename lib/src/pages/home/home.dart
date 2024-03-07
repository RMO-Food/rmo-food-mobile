import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/extensions.dart';
import 'package:rmo_food/src/components/widget_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 60,
            title: const ListTile(
              contentPadding: EdgeInsets.only(top: 20),
              leading: CircleAvatar(),
              title: Text("John"),
              subtitle: Text("Dashboard"),
              trailing: Icon(Icons.settings),
            )),
        body: SingleChildScrollView(
            child: Column(children: [
          FixedGaps.vertialGap20,
          AppWidgetHelper.decoratedContainer(context,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Your Address").title(),
                      Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () {},
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("Update").title(
                                        color: primaryColor, fontSize: 13),
                                    const Icon(Icons.arrow_forward_ios_sharp,
                                        size: 13, color: primaryColor)
                                  ])))
                    ])
              ]))
        ])));
  }
}
