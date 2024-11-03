import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/components/global/floating_bot.dart';
import 'package:obateka/app/components/pages/obateka/card_riwayat_obat.dart';
import 'package:obateka/app/controllers/detail-controllers/obateka_controller.dart';
import 'package:obateka/app/utils/formatedDate.dart';

class ObatekaPage extends StatelessWidget {
  const ObatekaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ObatekaController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Obateka',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Oktober",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            Obx(() {
              if (controller.riwayatResep.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children:
                    List.generate(controller.riwayatResep.length, (index) {
                  return CardRiwayatObat(
                    id: controller.riwayatResep[index]['id'],
                    nama_obat: controller.riwayatResep[index]['obat'][0]
                        ['nama_obat'],
                    tanggal: Formateddate.formatedDate(
                        controller.riwayatResep[index]['tanggal']),
                    rumah_sakit: controller.riwayatResep[index]
                        ['nama_rumah_sakit'],
                  );
                }),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingBot(),
    );
  }
}
