class HttpGetOrPostDataDto {
  final String path;
  final String? method;
  String? data;
  final Map<String, String>? query;

  HttpGetOrPostDataDto({
    String? method,
    required this.path,
    this.data,
    this.query,
  }) : method = method ?? 'GET';
}
