class CafeModel {
  final int? count;
  final String? next;
  final List<CafeDatum>? results;
  var previous;

  CafeModel({this.count, this.next, this.results, this.previous});

  factory CafeModel.fromJson(Map<String, dynamic> json) {
    return CafeModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: json['results'] != null
            ? (json['results'] as List)
                .map((item) => CafeDatum.fromJson(item))
                .toList()
            : []);
  }
}

class CafeDatum {
  final int? cafeId;
  final List<CafeBranch>? branch;
  final String? name;
  final String? address;
  final String? image;
  final String? businessPan;
  final bool? isHomeDelivery;
  final bool? isMainBranch;

  CafeDatum(
      {this.cafeId,
      this.branch,
      this.name,
      this.address,
      this.image,
      this.businessPan,
      this.isHomeDelivery,
      this.isMainBranch});

  factory CafeDatum.fromJson(Map<String, dynamic> json) {
    return CafeDatum(
        cafeId: json['id'],
        branch: json['branch'] != null
            ? (json['branch'] as List)
                .map((item) => CafeBranch.fromJson(item))
                .toList()
            : <CafeBranch>[],
        name: json['name'],
        address: json['address'],
        image: json['cafe_image'],
        businessPan: json['business_pan'],
        isHomeDelivery: json['is_home_delivery'],
        isMainBranch: json['is_main_branch']);
  }
}

class CafeBranch {
  final int? cafeId;
  final String? name;
  final String? address;

  CafeBranch({this.cafeId, this.name, this.address});

  factory CafeBranch.fromJson(Map<String, dynamic> json) {
    return CafeBranch(
        cafeId: json['id'],
        name: json['branch_name'],
        address: json['branch_address']);
  }
}
