import 'package:get/get.dart';
import 'package:obateka/app/controllers/detail-controllers/resep_obat_controller.dart';

class ResepObatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResepObatController>(() => ResepObatController());
  }
}
