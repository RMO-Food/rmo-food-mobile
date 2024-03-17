import 'package:flutter/material.dart';
import 'package:rmo_food/config/routes_imports.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/full_button.dart';
import 'package:rmo_food/src/components/widget_helper.dart';

class ChekoutScreen extends StatelessWidget {
  const ChekoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const AppBackButton(),
            title: const Text("Cart Items",
                style: TextStyle(fontSize: 18, color: primaryColor))),
        body: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppWidgetHelper.decoratedContainer(context,
                  height: 270,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    _items(context),
                    _items(context),
                    _items(context),
                    _items(context),
                    _items(context),
                    _items(context)
                  ]))),
              FixedGaps.verticalGap20,
              AppWidgetHelper.decoratedContainer(context,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Payment Method",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              InkWell(
                                  onTap: () {},
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      color: Colors.grey.shade400,
                                      child: const Text("Edit",
                                          style:
                                              TextStyle(color: Colors.white))))
                            ]),
                        FixedGaps.verticalGap10,
                        const Row(children: [
                          Icon(Icons.delivery_dining_rounded),
                          Text("Cash on Delivery")
                        ])
                      ])),
              FixedGaps.verticalGap10,
              const Text("Delivery Estimation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              AppWidgetHelper.decoratedContainer(context,
                  child: const ListTile(
                      leading: Icon(Icons.delivery_dining),
                      title: Text("Estimation time"),
                      subtitle: Text("30-40 mins"))),
              const Spacer(),
              FullButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.confirmOrder);
                  },
                  child: const Text("Proceed",
                      style: TextStyle(
                          color: Colors.white, fontFamily: "Lexend"))),
              FixedGaps.verticalGap10
            ])));
  }

  Widget _items(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 5),
        margin: const EdgeInsets.only(bottom: 10),
        height: 80,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(2)),
        child: Row(children: [
          const Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: SizedBox(
                  height: double.infinity,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/splash.png")))))),
          Flexible(
              flex: 3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Cheese Burger",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: "Lexend")),
                          RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: const TextSpan(children: [
                                TextSpan(
                                    text: "Ingredients: ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Lexend")),
                                TextSpan(
                                    text:
                                        "Cheese, tomato, onion rings, mayonnaiese.",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black54,
                                        fontFamily: "Lexend"))
                              ]))
                        ]),
                    const Spacer(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Rs. 250 -/",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold)),
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            InkWell(
                                onTap: () {},
                                child: const Icon(Icons.remove_circle,
                                    color: primaryColor, size: 30)),
                            FixedGaps.horizontalGap10,
                            const Text("0",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            FixedGaps.horizontalGap10,
                            InkWell(
                                onTap: () {},
                                child: const Icon(Icons.add_box_sharp,
                                    color: primaryColor, size: 30))
                          ])
                        ])
                  ]))
        ]));
  }
}
