part of 'orderflow_cubit.dart';

@immutable
sealed class OrderflowState {}

final class OrderflowInitial extends OrderflowState {}

final class CustomerOrderLoading extends OrderflowState {}

final class CustomerOrderFetched extends OrderflowState {}

final class CustomerOrderFetchError extends OrderflowState {}
