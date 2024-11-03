import 'package:get/get.dart';
import 'package:obateka/app/controllers/detail-controllers/obateka_controller.dart';

class ObatekaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ObatekaController>(() => ObatekaController());
  }
}
