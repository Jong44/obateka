import 'dart:async';

import 'package:get/get.dart';
import 'package:obateka/app/routes/app_router.dart';
import 'package:obateka/app/services/resep_service.dart';

class NotifikasiController extends GetxController {
  var id = Get.arguments['id'];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      setStatusResep();
    });
  }

  void setStatusResep() async {
    await ResepService().setStatusResep({
      'id': id,
    });
    Get.offAndToNamed(Routes.RESEP_OBAT, arguments: {
      'id': id,
    });
  }
}
