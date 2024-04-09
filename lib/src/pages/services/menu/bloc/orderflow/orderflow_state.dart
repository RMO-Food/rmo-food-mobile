part of 'orderflow_cubit.dart';

@immutable
sealed class OrderflowState {}

final class OrderflowInitial extends OrderflowState {}

final class CustomerOrderLoading extends OrderflowState {}

final class CustomerOrderFetched extends OrderflowState {
  final OrderModel orderModel;
  CustomerOrderFetched({required this.orderModel});
}

final class CustomerOrderFetchError extends OrderflowState {
  final String errorMessage;
  CustomerOrderFetchError(this.errorMessage);
}
