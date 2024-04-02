part of 'menu_item_cubit.dart';

@immutable
sealed class MenuItemState {}

final class MenuItemInitial extends MenuItemState {}

final class MenuItemFetching extends MenuItemState {}

final class MenuItemFetched extends MenuItemState {
  final MenuModel menuModel;
  MenuItemFetched({required this.menuModel});
}

final class MenuItemFetchError extends MenuItemState {
  final String errorMessage;

  MenuItemFetchError(this.errorMessage);
}
