import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rmo_food/constants.dart';
import 'package:rmo_food/infrastructure/endpoints.dart';
import 'package:rmo_food/infrastructure/repository/http_api_repo_impl.dart';
import 'package:rmo_food/locator/get_it.dart';
import 'package:rmo_food/src/pages/services/menu/data/model/menu.dart';

part 'menu_item_state.dart';

class MenuItemCubit extends Cubit<MenuItemState> {
  final _httpExecuter = getIt<HttpApiRepoImpl>();
  MenuItemCubit() : super(MenuItemInitial());

  void fetchMenuItem({int? limit = 0, int? offset = 0}) async {
    emit(MenuItemFetching());
    try {
      final response = await _httpExecuter.fetchApiRepo(
          path: URLConst.MENU_LIST,
          query: {"offset": offset.toString(), "limit": limit.toString()});
      Map<String, dynamic> responseBody = jsonDecode(response);
      MenuModel menuModel = MenuModel.fromJson(responseBody);
      emit(MenuItemFetched(menuModel: menuModel));
    } on String catch (e) {
      log(e.toString());
      emit(MenuItemFetchError(e.toString()));
    } catch (e) {
      log(e.toString());
      emit(MenuItemFetchError(RMOConst.defaultError));
    }
  }
}
