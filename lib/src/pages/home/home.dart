import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/extensions.dart';
import 'package:rmo_food/src/components/widget_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: null,
          subtitle: Text("Dashboard"),
        ),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  FixedGaps.vertialGap20,
                  // Address
                  AppWidgetHelper.decoratedContainer(context,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        FixedGaps.vertialGap5,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Your Address")
                                  .title(fontSize: 17, letterSpacing: -.5),
                              Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text("Update").title(
                                                color: primaryColor,
                                                fontSize: 13),
                                            const Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 13,
                                                color: primaryColor)
                                          ])))
                            ]),
                        const ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.location_on_outlined,
                                color: primaryColor),
                            title: Text("Jorpati, Kathmandu | Nepal"),
                            subtitle: Text("Opposite to S.P.S school"))
                      ])),
                  FixedGaps.vertialGap20,
                  AppWidgetHelper.decoratedContainer(context,
                      height: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        FixedGaps.vertialGap5,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("On The Way Orders")
                                  .title(fontSize: 17, letterSpacing: -.5),
                              Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text("View More").title(
                                                color: primaryColor,
                                                fontSize: 13),
                                            const Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 13,
                                                color: primaryColor)
                                          ])))
                            ]),
                        FixedGaps.vertialGap10,
                        Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Material(
                                    child: ListTile(
                                        splashColor: Colors.grey.shade200,
                                        onTap: () {},
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                            Icons.location_on_outlined,
                                            color: primaryColor),
                                        title: Text(index % 2 == 0
                                            ? "Shandar Momo"
                                            : "Trisara Restaurant"),
                                        subtitle: const Text(
                                            "Order Completed --- on Delivery")),
                                  );
                                }))
                      ])),
                  FixedGaps.vertialGap20,
                  AppWidgetHelper.decoratedContainer(context,
                      height: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(children: [
                        FixedGaps.vertialGap5,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Recent Completed Orders")
                                  .title(fontSize: 17, letterSpacing: -.5),
                              Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text("View All").title(
                                                color: primaryColor,
                                                fontSize: 13),
                                            const Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                size: 13,
                                                color: primaryColor)
                                          ])))
                            ]),
                        FixedGaps.vertialGap10,
                        Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Material(
                                    child: ListTile(
                                        splashColor: Colors.grey.shade200,
                                        onTap: () {},
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                            Icons.location_on_outlined,
                                            color: primaryColor),
                                        title: Text(index % 2 == 0
                                            ? "Shandar Momo"
                                            : "Trisara Restaurant"),
                                        subtitle: const Text(
                                            "Order Completed --- on Delivery"),
                                        trailing: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 30,
                                        )),
                                  );
                                }))
                      ])),
                  FixedGaps.vertialGap20
                ]))));
  }
}
