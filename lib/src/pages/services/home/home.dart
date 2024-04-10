import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/src/components/extensions.dart';
import 'package:rmo_food/src/components/widget_helper.dart';
import 'package:rmo_food/src/pages/services/menu/bloc/orderflow/orderflow_cubit.dart';
import 'package:rmo_food/src/pages/services/menu/presentation/orders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OrderflowCubit(), child: const _HomeScreen());
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({super.key});

  @override
  State<_HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen> {
  late final OrderflowCubit orderflowCubit;

  @override
  void initState() {
    orderflowCubit = BlocProvider.of<OrderflowCubit>(context)
      ..fetchCustomerOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(subtitle: Text("Dashboard")),
        body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              FixedGaps.verticalGap20,
              // Address
              AppWidgetHelper.decoratedContainer(context,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    FixedGaps.verticalGap5,
                    _title(
                        title: "Your Address",
                        onTap: () {
                          if (BlocProvider.of<AuthenticationCubit>(context)
                              .state is AuthenticationAuthenticated) {}
                        },
                        txtBtnName: "Update"),
                    const ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.location_on_outlined,
                            color: primaryColor),
                        title: Text("Jorpati, Kathmandu | Nepal"),
                        subtitle: Text("Opposite to S.P.S school"))
                  ])),
              FixedGaps.verticalGap20,
              AppWidgetHelper.decoratedContainer(context,
                  height: 300,
                  child: Column(children: [
                    FixedGaps.verticalGap5,
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: _title(
                            title: "On The Way Orders",
                            txtBtnName: "View More",
                            onTap: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (context) {
                                return BlocProvider.value(
                                    value: orderflowCubit,
                                    child: const CustomerOrders());
                              }));
                            })),
                    FixedGaps.verticalGap10,
                    Expanded(
                        child: BlocProvider.value(
                            value: orderflowCubit,
                            child: const CustomerOrders(showAppBar: false)))
                  ])),
              FixedGaps.verticalGap20,
              AppWidgetHelper.decoratedContainer(context,
                  height: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    FixedGaps.verticalGap5,
                    _title(
                        title: "Recent Completed Orders",
                        txtBtnName: "View All",
                        onTap: () {}),
                    FixedGaps.verticalGap10,
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
                                      trailing: const Icon(Icons.check_circle,
                                          color: Colors.green, size: 30)));
                            }))
                  ])),
              FixedGaps.verticalGap20
            ]));
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

  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => true;
}
