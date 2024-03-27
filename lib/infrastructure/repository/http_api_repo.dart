abstract class HttpApiRepo {
  Future<dynamic> fetchApiRepo(
      {String? method,
      required String path,
      Map<String, String>? query,
      String? data});
}
