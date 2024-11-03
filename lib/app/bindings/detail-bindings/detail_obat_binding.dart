import 'package:get/get.dart';
import 'package:obateka/app/controllers/detail-controllers/detail_obat_controller.dart';

class DetailObatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailObatController>(() => DetailObatController());
  }
}
