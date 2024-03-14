import 'package:flutter/material.dart';
import 'package:rmo_food/config/routes_imports.dart';
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
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.04,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.cafeDetail),
                        child: AppWidgetHelper.decoratedContainer(context,
                            child: Column(children: [
                              Flexible(
                                  flex: 10,
                                  child:
                                      Stack(clipBehavior: Clip.none, children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(2)),
                                            color: Colors.black,
                                            image: DecorationImage(
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
                                  flex: 8,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Chicken Burger",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "Lexend")),
                                                Text("Rs. 220/-",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontFamily: "Lexend"))
                                              ]),
                                          Spacer(),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.add_box_sharp,
                                                    color: primaryColor,
                                                    size: 30)
                                              ])
                                        ]),
                                  ))
                            ])));
                  }))
        ],
      ),
    );
  }
}
