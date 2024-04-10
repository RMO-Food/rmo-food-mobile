import 'package:flutter/material.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/widget_helper.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Column(children: [
            Text("Help And Support"),
            Text("Customer Support, FeedBack, FAQs",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey))
          ]),
          leading: const AppBackButton()),
      body: Column(
        children: [
          AppWidgetHelper.decoratedContainer(context,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Customer Support",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Divider(color: Colors.black12),
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/viber.png",
                        text: "Viber"),
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/facebook.png",
                        text: "Facebook messenger"),
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/whatsapp.png",
                        text: "WhatsApp"),
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/phone.png",
                        text: "1660193029 (Toll Free)"),
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/phone.png",
                        text: "9767295002 (Customer Phone)"),
                  ])),
          AppWidgetHelper.decoratedContainer(context,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Agent Support",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const Divider(color: Colors.black12),
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/mail.png",
                        text: "Email"),
                  ])),
          AppWidgetHelper.decoratedContainer(context,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/faq.png",
                        text: "FAQs",
                        subText: "Get help from FAQs"),
                    _supportWidgets(
                        onTap: () {},
                        image: "assets/images/report.png",
                        text: "Report Issues",
                        subText: "We would love to hear from you"),
                  ])),
        ],
      ),
    );
  }

  Widget _supportWidgets({
    required Function() onTap,
    required String image,
    required String text,
    String? subText,
  }) {
    return Material(
        child: InkWell(
            onTap: onTap,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(children: [
                  Image.asset(image, height: 20),
                  FixedGaps.horizontalGap20,
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(text),
                        if (subText != null)
                          Text(subText,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.grey))
                      ])
                ]))));
  }
}
