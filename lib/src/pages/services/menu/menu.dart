import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/widget_helper.dart';

class MenuScreen extends StatelessWidget {
  final List<String> foods = const [
    "Food",
    "Drink",
    "Dessert",
    "Snack",
    "Spicy"
  ];
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: Text("Menu",
              style: TextStyle(fontSize: 18, color: primaryColor),
              textAlign: TextAlign.center)),
      body: Column(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: foods
                      .map((item) => Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: primaryColor, width: 1.5),
                                  backgroundColor:
                                      item == "Food" ? primaryColor : null,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)))),
                              onPressed: () {},
                              child: Text(item,
                                  style: TextStyle(
                                      fontFamily: "Lexend",
                                      fontWeight: FontWeight.w900,
                                      color: item == "Food"
                                          ? Colors.white
                                          : primaryColor)))))
                      .toList())),
          FixedGaps.verticalGap10,
          Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.black12),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        // color: Colors.red,
                        // height: 60, // 40 if no image
                        child:
                            Stack(alignment: Alignment.centerRight, children: [
                          const Row(
                            children: [
                              Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Text("Chicken Burger",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    // Text("Description"),
                                    // FixedGaps.verticalGap10,
                                    Text("Rs. 305 -/",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ])),
                              // SizedBox(height: 70, width: 70),
                              // Container(
                              //     height: 70,
                              //     width: 70,
                              //     decoration: const BoxDecoration(
                              //         borderRadius: BorderRadius.vertical(
                              //             top: Radius.circular(2)),
                              //         image: DecorationImage(
                              //             image: AssetImage(
                              //                 "assets/images/splash.png")))),
                            ],
                          ),
                          InkWell(
                              onTap: () {},
                              child: AppWidgetHelper.decoratedContainer(context,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  borderRadius: 20,
                                  child: const Text("ADD",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold)))),
                          // Align(
                          //     alignment: Alignment.centerRight,
                          //     child: InkWell(
                          //         onTap: () {},
                          //         child: AppWidgetHelper.decoratedContainer(
                          //             context,
                          //             padding: const EdgeInsets.all(3),
                          //             borderRadius: 15,
                          //             border: const Border.fromBorderSide(
                          //                 BorderSide(color: primaryColor)),
                          //             child: Row(
                          //                 mainAxisSize: MainAxisSize.min,
                          //                 children: [
                          //                   InkWell(
                          //                       onTap: () {},
                          //                       child: const Icon(Icons.remove,
                          //                           size: 18,
                          //                           color: primaryColor)),
                          //                   FixedGaps.horizontalGap10,
                          //                   const Text("1",
                          //                       style: TextStyle(
                          //                           color: primaryColor)),
                          //                   FixedGaps.horizontalGap10,
                          //                   InkWell(
                          //                       onTap: () {},
                          //                       child: const Icon(Icons.add,
                          //                           size: 18,
                          //                           color: primaryColor))
                          //                 ]))))
                        ]));
                  }))
          // Expanded(
          //     child: GridView.builder(
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         itemCount: 10,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //             childAspectRatio: 1 / 1.04,
          //             crossAxisCount: 2,
          //             crossAxisSpacing: 20,
          //             mainAxisSpacing: 10),
          //         itemBuilder: (context, index) {
          //           return AppWidgetHelper.decoratedContainer(context,
          //               margin: const EdgeInsets.only(top: 5),
          //               child: Column(children: [
          //                 Flexible(
          //                     flex: 10,
          //                     child: Stack(clipBehavior: Clip.none, children: [

          //                       Container(
          //                           padding: const EdgeInsets.symmetric(
          //                               vertical: 5, horizontal: 10),
          //                           decoration: BoxDecoration(
          //                               color: Colors.orange.shade800,
          //                               boxShadow: const [
          //                                 BoxShadow(
          //                                     color: Colors.black26,
          //                                     blurRadius: 4)
          //                               ]),
          //                           child: const Center(
          //                               child: Text("30%",
          //                                   style: TextStyle(
          //                                       color: Colors.white))))
          //                     ])),
          //                 Flexible(
          //                     flex: 8,
          //                     child: Padding(
          //                         padding: const EdgeInsets.symmetric(
          //                             horizontal: 8.0),
          //                         child: Column(
          //                             crossAxisAlignment:
          //                                 CrossAxisAlignment.stretch,
          //                             children: [
          //                               const Column(
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.start,
          //                                   children: [
          //                                     Text("Chicken Burger",
          //                                         style: TextStyle(
          //                                             fontWeight:
          //                                                 FontWeight.bold,
          //                                             fontFamily: "Lexend")),
          //                                     Text("Rs. 220/-",
          //                                         style: TextStyle(
          //                                             color: Colors.black54,
          //                                             fontFamily: "Lexend"))
          //                                   ]),
          //                               const Spacer(),
          //                               Row(
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.end,
          //                                   children: [
          //                                     InkWell(
          //                                         onTap: () {},
          //                                         child: const Icon(
          //                                             Icons.add_box_sharp,
          //                                             color: primaryColor,
          //                                             size: 30))
          //                                   ])
          //                             ])))
          //               ]));
          //         }))
        ],
      ),
    );
  }
}
