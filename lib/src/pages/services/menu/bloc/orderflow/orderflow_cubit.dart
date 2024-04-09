import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rmo_food/src/pages/services/menu/data/model/order.dart';
import 'package:rmo_food/src/pages/services/menu/data/repo/order_repo.dart';

part 'orderflow_state.dart';

class OrderflowCubit extends Cubit<OrderflowState> {
  final _orderApiRepoIml = OrderApiRepoIml();
  OrderflowCubit() : super(OrderflowInitial());

  void fetchCustomerOrder() async {
    emit(CustomerOrderLoading());
    try {
      final orders = await _orderApiRepoIml.fetchOrders();
      if (orders != null) {
        emit(CustomerOrderFetched(orderModel: orders));
        return;
      }
      emit(CustomerOrderFetchError("Something went wrong."));
    } on String catch (e) {
      emit(CustomerOrderFetchError(e.toString()));
    } catch (e) {
      emit(CustomerOrderFetchError("Something went wrong."));
    }
  }
}
