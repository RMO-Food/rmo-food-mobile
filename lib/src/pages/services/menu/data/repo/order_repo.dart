import 'dart:convert';
import 'dart:developer';

import 'package:rmo_food/infrastructure/endpoints.dart';
import 'package:rmo_food/infrastructure/repository/http_api_repo_impl.dart';
import 'package:rmo_food/src/pages/services/menu/data/model/order.dart';

abstract class OrderApiRepo {
  Future<OrderModel?> fetchOrders();
}

class OrderApiRepoIml implements OrderApiRepo {
  final HttpApiRepoImpl _httpExecuter = HttpApiRepoImpl();

  @override
  Future<OrderModel?> fetchOrders() async {
    OrderModel? orderModel;
    try {
      final response =
          await _httpExecuter.fetchApiRepo(path: URLConst.CUSTOMER_ORDER);
      orderModel = OrderModel.fromJson(jsonDecode(response)['data']);
      return orderModel;
    } catch (e) {
      log(e.toString());
      return orderModel;
    }
  }
}
