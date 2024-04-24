import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/error_message.dart';
import 'package:rmo_food/helper/loading_bar.dart';
import 'package:rmo_food/src/pages/services/menu/bloc/orderflow/orderflow_cubit.dart';

class CustomerOrders extends StatefulWidget {
  final bool? showAppBar;
  const CustomerOrders({super.key, this.showAppBar = true});

  @override
  State<CustomerOrders> createState() => _CustomerOrdersState();
}

class _CustomerOrdersState extends State<CustomerOrders> {
  late final OrderflowCubit orderflowCubit;
  @override
  void initState() {
    orderflowCubit = BlocProvider.of<OrderflowCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.showAppBar!
            ? AppBar(
                leading: const AppBackButton(),
                title: const Text("Your Orders"))
            : null,
        body: RefreshIndicator(
            onRefresh: () async => orderflowCubit.fetchCustomerOrder(),
            child: BlocBuilder<OrderflowCubit, OrderflowState>(
                builder: (context, state) {
              if (state is CustomerOrderLoading) {
                return const ScreenLoadingIndicator();
              }
              if (state is CustomerOrderFetchError) {
                return ErrorMessage(
                    onPressed: orderflowCubit.fetchCustomerOrder,
                    errorMessage: state.errorMessage);
              }
              if (state is CustomerOrderFetched) {
                final orders = state.orderModel.orders ?? [];

                return orders.isEmpty
                    ? const Center(child: Text("No items to show."))
                    : ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                              initiallyExpanded: true,
                              backgroundColor: Colors.transparent,
                              title: Text("Order Id - ${orders[index].id}"),
                              shape: const BeveledRectangleBorder(),
                              children: orders[index].items?.map((items) {
                                    return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Material(
                                              child: ListTile(
                                                  splashColor:
                                                      Colors.grey.shade200,
                                                  onTap: () {},
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  leading: const Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      color: primaryColor),
                                                  title: Text(
                                                      "Item Id - ${items.id}"),
                                                  subtitle: Text(
                                                      _getOrderStatus(
                                                          orders[index]
                                                                  .status ??
                                                              ""))))
                                        ]);
                                  }).toList() ??
                                  []);
                        });
              }
              return const SizedBox.shrink();
            })));
  }

  String _getOrderStatus(String status) {
    switch (status) {
      case "kitchen_preparing":
        return "Order Received -- In Kitchen";
      case "order_approved":
        return "Order Approved -- Order Received";
      case "order_pending":
        return "Order Pending";
      default:
        return "Order Pending";
    }
  }
}

class RecentOrders extends StatefulWidget {
  final bool? showAppBar;
  final OrderflowCubit recentOrderflowCubit;
  const RecentOrders(
      {super.key, this.showAppBar = true, required this.recentOrderflowCubit});

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.showAppBar!
            ? AppBar(
                leading: const AppBackButton(),
                title: const Text("Recent Orders"))
            : null,
        body: RefreshIndicator(
            onRefresh: () async {
              widget.recentOrderflowCubit.fetchCustomerOrder();
            },
            child: BlocBuilder<OrderflowCubit, OrderflowState>(
                bloc: widget.recentOrderflowCubit,
                builder: (context, state) {
                  if (state is CustomerOrderLoading) {
                    return const ScreenLoadingIndicator();
                  }
                  if (state is CustomerOrderFetchError) {
                    return ErrorMessage(
                        onPressed: () {}, errorMessage: state.errorMessage);
                  }
                  if (state is CustomerOrderFetched) {
                    final orders = state.orderModel.orders ?? [];

                    return orders.isEmpty
                        ? const Center(child: Text("No items to show."))
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                  initiallyExpanded: true,
                                  backgroundColor: Colors.transparent,
                                  title: Text("Order Id - ${orders[index].id}"),
                                  shape: const BeveledRectangleBorder(),
                                  children: orders[index].items?.map((items) {
                                        return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Material(
                                                  child: ListTile(
                                                splashColor:
                                                    Colors.grey.shade200,
                                                onTap: () {},
                                                contentPadding: EdgeInsets.zero,
                                                leading: const Icon(
                                                    Icons.location_on_outlined,
                                                    color: primaryColor),
                                                title: Text(
                                                    "Item Id - ${items.id}"),
                                                subtitle: const Text(
                                                    "Order Completed"),
                                                trailing: const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                  size: 30,
                                                ),
                                              ))
                                            ]);
                                      }).toList() ??
                                      []);
                            });
                  }
                  return const SizedBox.shrink();
                })));
  }
}
