import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/bloc/authentication/authentication_cubit.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/custom_appbar.dart';
import 'package:rmo_food/helper/gap.dart';
import 'package:rmo_food/locator/get_it.dart';
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
  const _HomeScreen();

  @override
  State<_HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<_HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final OrderflowCubit orderflowCubit;
  late final OrderflowCubit recentOrderflowCubit;

  @override
  void initState() {
    orderflowCubit = BlocProvider.of<OrderflowCubit>(context)
      ..fetchCustomerOrder();
    recentOrderflowCubit = getIt<OrderflowCubit>()..fetchCustomerOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                            title: "onTheWayOrder",
                            txtBtnName: "See All",
                            onTap: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (context) {
                                return BlocProvider.value(
                                    value: orderflowCubit,
                                    child: const CustomerOrders());
                              }));
                            })),
                    FixedGaps.verticalGap10,
                    const Expanded(child: CustomerOrders(showAppBar: false))
                  ])),
              FixedGaps.verticalGap20,
              AppWidgetHelper.decoratedContainer(context,
                  height: 300,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    FixedGaps.verticalGap5,
                    _title(
                        title: "recentOrders",
                        txtBtnName: "See All",
                        onTap: () {
                          Navigator.push(context,
                              CupertinoPageRoute(builder: (context) {
                            return BlocProvider.value(
                                value: recentOrderflowCubit,
                                child: RecentOrders(
                                    recentOrderflowCubit:
                                        recentOrderflowCubit));
                          }));
                        }),
                    FixedGaps.verticalGap10,
                    Expanded(
                        child: RecentOrders(
                            recentOrderflowCubit: recentOrderflowCubit,
                            showAppBar: false))
                  ])),
              FixedGaps.verticalGap20
            ]));
  }

  Row _title(
      {required String title,
      required String txtBtnName,
      required Function() onTap}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title.tr()).title(fontSize: 17, letterSpacing: -.5),
      Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onTap,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(txtBtnName.tr())
                        .title(color: primaryColor, fontSize: 13),
                    const Icon(Icons.arrow_forward_ios_sharp,
                        size: 13, color: primaryColor)
                  ])))
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
