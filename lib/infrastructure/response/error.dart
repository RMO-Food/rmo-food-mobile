class ErrorRes {
  final String errorMessage;
  ErrorRes({required this.errorMessage});
  factory ErrorRes.error(Map<String, dynamic> json) => ErrorRes(
      errorMessage:
          json['detail'] ?? json['email']?[0] ?? json['password']?[0]);
}
