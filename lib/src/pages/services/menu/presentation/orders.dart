import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rmo_food/core/theme/common_theme.dart';
import 'package:rmo_food/helper/back_button.dart';
import 'package:rmo_food/helper/error_message.dart';
import 'package:rmo_food/helper/loading_bar.dart';
import 'package:rmo_food/src/pages/services/menu/bloc/orderflow/orderflow_cubit.dart';
import 'package:rmo_food/src/pages/services/menu/data/model/order.dart';

class CustomerOrders extends StatefulWidget {
  final bool? showAppBar;
  const CustomerOrders({super.key, this.showAppBar = true});

  @override
  State<CustomerOrders> createState() => _CustomerOrdersState();
}

class _CustomerOrdersState extends State<CustomerOrders> {
  late final OrderflowCubit orderflowCubit;
  int kitchendIndex = 0;
  int orderApprovedIndex = 0;
  int orderPendingIndex = 0;
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
                final kitchenOrder = <OrderItem>[];
                final approvedOrder = <OrderItem>[];
                final pendingOrder = <OrderItem>[];

                for (OrderDatum orderDatum in orders) {
                  switch (orderDatum.status) {
                    case "order_approved":
                      approvedOrder.addAll(orderDatum.items ?? []);
                      break;
                    case "order_pending":
                      pendingOrder.addAll(orderDatum.items ?? []);
                      break;
                    case "kitchen_preparing":
                      kitchenOrder.addAll(orderDatum.items ?? []);
                      break;
                    default:
                  }
                }
                final List<OrderItem> listedOrders = [
                  ...approvedOrder,
                  ...pendingOrder,
                  ...kitchenOrder
                ];
                return orders.isEmpty
                    ? const Center(child: Text("No items to show."))
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const BouncingScrollPhysics(),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          final OrderItem orderDatum = listedOrders[index];
                          return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Material(
                                    child: ListTile(
                                        splashColor: Colors.grey.shade200,
                                        onTap: () {},
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                            Icons.location_on_outlined,
                                            color: primaryColor),
                                        title: Text("${orderDatum.id}"),
                                        subtitle: const Text(
                                            "Order Completed --- on Delivery")))
                              ]);
                        });
              }
              return const SizedBox.shrink();
            })));
  }
}
