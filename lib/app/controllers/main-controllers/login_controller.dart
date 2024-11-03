import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:obateka/app/routes/app_router.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var captchaController = TextEditingController();

  var jenisIdentitas = 'nik'.obs;

  void changeJenisIdentitas(String value) {
    jenisIdentitas.value = value;
  }

  void login() {
    if (emailController.text != "" || passwordController.text != "") {
      Get.offNamed(Routes.HOME);
    } else {
      Get.snackbar(
        'Error',
        'Email dan Password tidak boleh kosong',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
