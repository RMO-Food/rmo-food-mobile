part of 'cafe_cubit.dart';

@immutable
sealed class CafeState {}

final class CafeInitial extends CafeState {}

final class CafeListFetching extends CafeState {}

final class CafeListFetched extends CafeState {
  final CafeModel cafeModel;
  CafeListFetched({required this.cafeModel});
}

final class CafeListFetchError extends CafeState {
  final String errorMessage;
  CafeListFetchError(this.errorMessage);
}
