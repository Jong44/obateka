import 'package:get/get.dart';
import 'package:obateka/app/services/resep_service.dart';

class ObatekaController extends GetxController {
  var riwayatResep = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRiwayatResep();
  }

  void getRiwayatResep() async {
    final List data = await ResepService().getRiwatResepFromJson();
    riwayatResep.value = data;
  }
}
