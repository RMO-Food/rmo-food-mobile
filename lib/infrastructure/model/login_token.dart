class LoginToken {
  final String? refreshToken;
  final String? accessToken;
  LoginToken({required this.refreshToken, required this.accessToken});

  factory LoginToken.fromJson(Map<String, dynamic> json) =>
      LoginToken(refreshToken: json['refresh'], accessToken: json['access']);
}
