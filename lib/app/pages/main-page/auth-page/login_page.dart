import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/components/global/button_main.dart';
import 'package:obateka/app/components/global/check_main.dart';
import 'package:obateka/app/components/global/text_filed_main.dart';
import 'package:obateka/app/controllers/main-controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const Text(
                  'Masuk Akun Anda',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Selamat datang kembali! Mohon masukkan detail Anda.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Pilih Jenis Identitas',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Obx(
                      () => CheckMain(
                        title: "Nomor Induk Kependudukan",
                        value: "nik",
                        groupValue: controller.jenisIdentitas.value,
                        onChanged: (value) {
                          controller.changeJenisIdentitas(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Obx(
                      () => CheckMain(
                        title: "Nomor Kartu JKN",
                        value: "jkn",
                        groupValue: controller.jenisIdentitas.value,
                        onChanged: (value) {
                          controller.changeJenisIdentitas(value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFiledMain(
                  controller: controller.emailController,
                  title: "Email",
                  hintText: "Email Mobile JKN Anda",
                ),
                const SizedBox(height: 20),
                TextFiledMain(
                  controller: TextEditingController(),
                  title: "Kata Sandi",
                  hintText: "Kata Sandi Mobile JKN Anda",
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                TextFiledMain(
                  controller: TextEditingController(),
                  title: "Captca",
                  hintText: "Kata Sandi Mobile JKN Anda",
                ),
                const SizedBox(height: 130),
                ButtonMain(
                  title: "Masuk",
                  onPressed: () {
                    controller.login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
