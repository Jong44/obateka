import 'dart:convert';

import 'package:get/get.dart';
import 'package:obateka/app/services/resep_service.dart';

class ResepObatController extends GetxController {
  var id = Get.arguments['id'];
  var resep = {}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    resepById();
  }

  void resepById() async {
    final data = await ResepService().getRiwayatResepById(id.toString());
    final result = await getStatusResep(data);
    resep.value = result;
    print(resep);
  }

  Future getStatusResep(Map resep) async {
    final ress = await ResepService().getAllStatusResep();

    // Check if ress contains the same ID as the one in resep
    if (ress.contains(resep["id"])) {
      resep["status"] = "confirmed";
    }
    return resep;
  }
}
