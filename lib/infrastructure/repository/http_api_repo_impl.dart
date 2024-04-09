import 'package:rmo_food/core/error_handler.dart';
import 'package:rmo_food/infrastructure/data/http_execute_dto.dart';
import 'package:rmo_food/infrastructure/repository/http_api_repo.dart';
import 'package:rmo_food/service/http_executer.dart';

class HttpApiRepoImpl implements HttpApiRepo {
  ErrorHandler errorHandler = ErrorHandler();
  HttpExecuter httpExecuter = HttpExecuter();

  @override
  Future<dynamic> fetchApiRepo(
      {String? method,
      required String path,
      Map<String, String>? query,
      String? data}) async {
    final String? errorMessage;
    HttpGetOrPostDataDto httpGetOrPostDataDto = HttpGetOrPostDataDto(
        method: method, path: path, query: query ?? {}, data: data);
    final responseData =
        await httpExecuter.finalExecution(httpGetOrPostDataDto);
    errorMessage = "";
    // errorHandler.getValidationMessage(jsonDecode(responseData ?? '{}'));
    try {
      if (errorMessage.isNotEmpty) throw errorMessage;
      return responseData;
    } catch (e) {
      throw errorMessage;
    }
  }
}
