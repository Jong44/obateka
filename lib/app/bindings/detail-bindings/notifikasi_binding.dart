import 'package:get/get.dart';
import 'package:obateka/app/controllers/detail-controllers/notifikasi_controller.dart';

class NotifikasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiController>(() => NotifikasiController());
  }
}
