import 'package:dio/dio.dart';
import 'package:news_app_task/utils/core_service/dio_exceptions.dart';

//CORE DIO CLIENT
abstract class DioClient {
  final Dio _dio = Dio();

  set baseUrl(String baseUrl) => _dio.options.baseUrl = baseUrl;

  Future<Response<dynamic>?> getRequest({required String url, Map<String, dynamic>? queryParameters}) async {
    Response<dynamic> response = await _dio.get(url, queryParameters: queryParameters);
    return _responseProcessor(response);
  }

  Response<dynamic> _responseProcessor(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException();
      default:
        throw FetchDataException();
    }
  }
}
