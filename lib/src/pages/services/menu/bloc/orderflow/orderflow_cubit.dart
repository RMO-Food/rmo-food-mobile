import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orderflow_state.dart';

class OrderflowCubit extends Cubit<OrderflowState> {
  OrderflowCubit() : super(OrderflowInitial());

  void fetchCustomerOrder() async {
    try {} catch (e) {}
  }
}
