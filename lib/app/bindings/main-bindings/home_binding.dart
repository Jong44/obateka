import 'package:get/get.dart';
import 'package:obateka/app/controllers/main-controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
