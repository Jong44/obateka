import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/entypo.dart';
import 'package:obateka/app/config/ColorConfig.dart';
import 'package:obateka/app/controllers/detail-controllers/notifikasi_controller.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotifikasiController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qr Code Obat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 200),
            RippleAnimation(
              repeat: true,
              color: ColorConfig.primaryColor,
              minRadius: 50,
              ripplesCount: 3,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConfig.primaryColor,
                ),
                child: const Center(
                  child: Iconify(
                    Entypo.check,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Resep Obat Anda Telah Terkonfirmasi!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Obat yang diresepkan oleh dokter telah berhasil diperoleh\n Terima kasih banyak atas kepercayaan Anda.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: ColorConfig.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
