import 'package:get/get.dart';
import 'package:obateka/app/controllers/main-controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
