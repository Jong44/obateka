import 'package:get/get.dart';
import 'package:obateka/app/controllers/main-controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
