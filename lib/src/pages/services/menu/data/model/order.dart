class OrderModel {
  final List<OrderDatum>? orders;

  OrderModel({required this.orders});

  factory OrderModel.fromJson(List data) => OrderModel(
      orders:
          List.from(data.map((json) => OrderDatum.fromJson(json)).toList()));
}

class OrderDatum {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final int? orderId;
  final String? extra;
  final String? status;
  final List<OrderItem>? items;
  OrderDatum(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.orderId,
      required this.extra,
      required this.status,
      required this.items});

  factory OrderDatum.fromJson(Map<String, dynamic> json) => OrderDatum(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      orderId: json['order_id'],
      extra: json['extra'],
      status: json['status'],
      items: json['items'] != null
          ? List.from((json['items'] as List)
              .map((json) => OrderItem.fromJson(json))
              .toList())
          : <OrderItem>[]);
}

class OrderItem {
  final int? id;
  final String? name;
  final String? price;
  final String? image;
  var params;

  OrderItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.params});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'],
      name: json['items_name'],
      price: json['item_price'],
      image: json['image'],
      params: json['params']);
}
