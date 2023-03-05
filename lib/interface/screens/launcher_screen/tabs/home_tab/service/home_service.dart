import 'package:get/get.dart';
import 'package:news_app_task/interface/widgets/alert/error_alert.dart';
import 'package:news_app_task/source/keys/app_keys.dart';
import 'package:news_app_task/source/models/model_news.dart';
import 'package:news_app_task/utils/core_service/dio_client.dart';
import 'package:news_app_task/utils/core_service/dio_exceptions.dart';
import 'package:news_app_task/utils/core_service/dio_urls.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class ServiceOfHome with DioClient {
  ServiceOfHome._();

  static ServiceOfHome get shared => ServiceOfHome._();

  Future<ModelOfNews> getNews({required ApiCountryQuerry country}) async {
    try {
      var response = await getRequest(url: "${DioUrls.instance.baseUrl}${country.name}&apiKey=${AppKeys.shared.apiKEY}");
      if (response?.data != null) {
        ModelOfNews trial = ModelOfNews.fromJson(response!.data);
        return trial;
      } else {
        return ModelOfNews();
      }
    } on BadRequestException catch (e) {
      Get.dialog(ErrorAlert(error: e.showMessage));
      return ModelOfNews();
    } on FetchDataException catch (e) {
      Get.dialog(ErrorAlert(error: e.showMessage));
      return ModelOfNews();
    } catch (e) {
      Get.dialog(ErrorAlert(error: e.toString()));
      return ModelOfNews();
    }
  }
}
