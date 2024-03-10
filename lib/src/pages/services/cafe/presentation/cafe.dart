import 'package:flutter/material.dart';
import 'package:rmo_food/config/routes_imports.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/widget_helper.dart';

class CafeScreen extends StatelessWidget {
  const CafeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            title: Text("Restaurants",
                style: TextStyle(fontSize: 18, color: primaryColor),
                textAlign: TextAlign.center)),
        body: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.cafeDetail),
                    child: AppWidgetHelper.decoratedContainer(context,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Column(children: [
                          Flexible(
                              flex: 2,
                              child: Stack(clipBehavior: Clip.none, children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(2)),
                                        color: Colors.black,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/splash.png")))),
                                Positioned(
                                    left: -8,
                                    top: 10,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.orange.shade800,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  blurRadius: 4)
                                            ]),
                                        child: const Center(
                                            child: Text("30%",
                                                style: TextStyle(
                                                    color: Colors.white)))))
                              ])),
                          const Flexible(
                              flex: 1,
                              child: Column(children: [
                                ListTile(
                                    title: Text("Trisara"),
                                    subtitle: Text("Kathmandu, Durbar marg")),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.timelapse_rounded,
                                          size: 15, color: primaryColor),
                                      Text("8am - 9pm"),
                                      FixedGaps.horizontalGap10
                                    ])
                              ]))
                        ])),
                  );
                })));
  }
}
