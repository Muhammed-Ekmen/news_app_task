import 'package:get/get.dart';
import 'package:news_app_task/utils/tools/enums.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  fetch() async {
    await Future.delayed(IDuration.short.adjust);
    Get.offNamed(IRoutes.launcher.path);
  }
}
