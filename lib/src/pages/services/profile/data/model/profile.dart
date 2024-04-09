class ProfileData {
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  ProfileData(
      {required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.address});

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
        firstName: json['first_name'] ?? "",
        middleName: json['mid_name'] ?? "",
        lastName: json['last_name'] ?? "",
        phone: json['phone'] ?? "",
        email: json['email'] ?? "",
        address: json['address_name'] ?? "");
  }
}
