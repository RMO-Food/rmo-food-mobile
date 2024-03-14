import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/services/menu/menu.dart';

class CafeDetailScreen extends StatelessWidget {
  const CafeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.topCenter, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
            flex: 1,
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/splash.png"))))),
        Flexible(
            flex: 2,
            child: Column(children: [
              FixedGaps.verticalGap50,
              // FixedGaps.verticalGap30,
              SingleChildScrollView(
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    _fitlerButtons(icon: Icons.coffee, name: "Beverage"),
                    _fitlerButtons(icon: Icons.local_pizza, name: "Fast Food"),
                    _fitlerButtons(icon: Icons.cake, name: "Dessert"),
                    _fitlerButtons(
                        icon: Icons.room_service_sharp, name: "Dinner"),
                    _fitlerButtons(icon: Icons.star_rounded, name: "Special")
                  ])),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Popular",
                            style: Theme.of(context).textTheme.titleLarge!)),
                    Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.only(
                                top: 4, left: 8, right: 8),
                            separatorBuilder: (context, index) =>
                                FixedGaps.verticalGap20,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return AppWidgetHelper.decoratedContainer(context,
                                  padding: const EdgeInsets.only(
                                      left: 5, bottom: 5, top: 5),
                                  height: 100,
                                  child: Row(children: [
                                    const Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: SizedBox(
                                            height: double.infinity,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/splash.png")))))),
                                    FixedGaps.horizontalGap5,
                                    Flexible(
                                        flex: 3,
                                        child: Column(children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Cheese Burger",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: "Lexend")),
                                              RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Ingredients: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                    TextSpan(
                                                        text:
                                                            "Cheese, tomato, onion rings, mayonnaise.",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black54))
                                                  ]))
                                            ],
                                          ),
                                          const Spacer(),
                                          const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Rs. 250 -/",
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Icon(Icons.add_box_sharp,
                                                    color: primaryColor,
                                                    size: 30)
                                              ])
                                        ]))
                                  ]));
                            }))
                  ]))
            ]))
      ]),
      Positioned(
          top: 60,
          child: IntrinsicWidth(
              child: Column(children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.only(left: 6),
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.grey, blurRadius: 5)
                    ], color: Colors.white, shape: BoxShape.circle),
                    child: const AppBackButton(size: 18))),
            FixedGaps.verticalGap30,
            AppWidgetHelper.decoratedContainer(context,
                height: 170,
                width: 350,
                child: Column(children: [
                  ListTile(
                      title: const Text("Trisara"),
                      subtitle: const Text("Kathmandu, Durbar marg"),
                      trailing: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const MenuScreen()));
                          },
                          child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Full Menu",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Icon(Icons.arrow_forward_ios,
                                    size: 14, color: primaryColor)
                              ]))),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 14.0, bottom: 14.0, right: 14.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 100,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.orange.shade800,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 4)
                                        ]),
                                    child: const Center(
                                        child: Text("Today's offer",
                                            style: TextStyle(
                                                color: Colors.white)))),
                                Expanded(
                                    child: ListView.builder(
                                        padding: const EdgeInsets.only(top: 10),
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          return const Row(children: [
                                            Text("•"),
                                            Expanded(
                                                child:
                                                    Text("20% for more than 5"
                                                        " thousand bill."))
                                          ]);
                                        })),
                                const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.timelapse_rounded,
                                          size: 15, color: primaryColor),
                                      Text("8am - 9pm"),
                                      FixedGaps.horizontalGap10
                                    ])
                              ])))
                ]))
          ])))
    ]));
  }

  Widget _fitlerButtons(
      {required IconData icon, double? size, required String name}) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(size ?? 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
          child: Icon(icon, color: primaryColor)),
      FixedGaps.verticalGap5,
      Opacity(opacity: .6, child: Text(name))
    ]);
  }
}
