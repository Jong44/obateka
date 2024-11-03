import 'dart:async';

import 'package:get/get.dart';
import 'package:obateka/app/routes/app_router.dart';

class QrController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final id = Get.arguments['id'];
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(Routes.NOTIFIKASI, arguments: {
        'id': id,
      });
    });
  }
}
