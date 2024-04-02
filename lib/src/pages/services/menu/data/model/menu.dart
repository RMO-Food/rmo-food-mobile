class MenuModel {
  final int? count;
  final String? next;
  final List<MenuCategories>? results;
  var previous;

  MenuModel({this.count, this.next, this.results, this.previous});

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: json['results'] != null
            ? (json['results'] as List)
                .map((item) => MenuCategories.fromJson(item))
                .toList()
            : []);
  }
}

class MenuCategories {
  final int? menuId;
  final List<MenuItem>? items;
  final String? categoryName;
  final String? discount;
  final String? image;
  final String? identifier;

  MenuCategories(
      {this.menuId,
      this.items,
      this.categoryName,
      this.discount,
      this.image,
      this.identifier});

  factory MenuCategories.fromJson(Map<String, dynamic> json) {
    return MenuCategories(
        menuId: json['id'],
        items: json['items'] != null
            ? (json['items'] as List)
                .map((item) => MenuItem.fromJson(item))
                .toList()
            : <MenuItem>[],
        categoryName: json['menu_name'],
        discount: json['discount'],
        image: json['menu_image'],
        identifier: json['menu_identifire']);
  }
}

class MenuItem {
  final int? menuId;
  final String? name;
  final String? price;
  final String? image;
  var params;

  MenuItem({this.menuId, this.name, this.price, this.image, this.params});

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
        menuId: json['id'],
        name: json['items_name'],
        price: json['item_price'],
        image: json['image'],
        params: json['params']);
  }
}
