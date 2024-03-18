import 'package:flutter/material.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/extensions.dart';
import 'package:rmo_food/src/components/full_button.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/authentication/helper/validations.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            leading: const AppBackButton(),
            title: const Text("Confirm Order",
                style: TextStyle(fontSize: 18, color: primaryColor))),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              AppWidgetHelper.decoratedContainer(context,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    FixedGaps.verticalGap5,
                    _title(
                        title: "Your Address",
                        onTap: () {},
                        txtBtnName: "Update"),
                    const ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.location_on_outlined,
                            color: primaryColor),
                        title: Text("Jorpati, Kathmandu | Nepal"),
                        subtitle: Text("Opposite to S.P.S school"))
                  ])),
              AppWidgetHelper.decoratedContainer(context,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FixedGaps.verticalGap5,
                        const Text("Billing Information")
                            .title(fontSize: 17, letterSpacing: -.5),
                        const Divider(color: Colors.black12),
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Total: "), Text("Rs. 2950 -/")]),
                        const Divider(color: Colors.black12),
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Discount: "), Text("--")]),
                        const Divider(color: Colors.black12),
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery Charge: "),
                              Text("Rs. 85 -/")
                            ]),
                        const Divider(color: Colors.black12),
                        FixedGaps.verticalGap30,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Grand Total")
                                  .title(fontSize: 14, letterSpacing: -.5),
                              const Text("Rs. 3035 -/")
                                  .title(fontSize: 14, letterSpacing: -.5)
                            ])
                      ])),
              FixedGaps.verticalGap10,
              TextFormField(
                  cursorColor: primaryColor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormValidation.remarksValidation,
                  decoration: const InputDecoration(hintText: "Remarks"),
                  style: const TextStyle(fontSize: 12)),
              const Spacer(),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: FullButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Future.delayed(const Duration(milliseconds: 100))
                            .whenComplete(() => Navigator.popUntil(
                                context, (routes) => routes.isFirst));
                      },
                      btnName: "Place Order")),
              FixedGaps.verticalGap10
            ])));
  }

  Row _title(
      {required String title,
      required String txtBtnName,
      required Function() onTap}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title).title(fontSize: 17, letterSpacing: -.5),
      Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onTap,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(txtBtnName).title(color: primaryColor, fontSize: 13),
                    const Icon(Icons.arrow_forward_ios_sharp,
                        size: 13, color: primaryColor)
                  ])))
    ]);
  }
}
