import 'package:get/get.dart';
import 'package:obateka/app/controllers/detail-controllers/qr_controller.dart';

class QrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => QrController(),
    );
  }
}
