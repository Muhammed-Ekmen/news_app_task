import 'package:dio/dio.dart';
import 'package:news_app_task/utils/core_service/dio_exceptions.dart';

//CORE DIO CLIENT
abstract class DioClient {
  final Dio _dio = Dio();

  set baseUrl(String baseUrl) => _dio.options.baseUrl = baseUrl;

  Future<Response<dynamic>?> getRequest({required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      Response<dynamic> response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      return _responseProcessor(statusCode: e.response?.statusCode);
    }
  }

  _responseProcessor({int? statusCode}) {
    if (statusCode != null) {
      if (statusCode >= 200 && statusCode <= 300) {}
      if (statusCode >= 400 && statusCode < 500) {
        throw BadRequestException();
      }
      if (statusCode >= 500) {
        throw ServerException();
      } else {
        throw FetchDataException();
      }
    } else {
      throw SocketException();
    }
  }
}
