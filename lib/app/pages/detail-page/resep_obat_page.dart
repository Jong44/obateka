import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:obateka/app/components/global/button_main.dart';
import 'package:obateka/app/components/global/floating_bot.dart';
import 'package:obateka/app/components/global/list_markdown.dart';
import 'package:obateka/app/components/pages/resep_dokter/card_obat.dart';
import 'package:obateka/app/components/pages/resep_dokter/card_content_resep.dart';
import 'package:obateka/app/config/ColorConfig.dart';
import 'package:obateka/app/controllers/detail-controllers/resep_obat_controller.dart';
import 'package:obateka/app/routes/app_router.dart';
import 'package:obateka/app/utils/formatedDate.dart';

class ResepObatPage extends StatelessWidget {
  const ResepObatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ResepObatController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Resep Obat',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorConfig.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Resep Obat',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return CardContentResep(
                              title: controller.resep['nama_rumah_sakit'] ??
                                  "Rumah Sakit",
                              subtitle: "No Faktur :",
                              id: "${controller.resep['id']} ${Formateddate.formatedDate(controller.resep['tanggal'] ?? DateTime.now().toString())}",
                            );
                          }),
                          InkWell(
                            onTap: () {
                              Get.offNamed(Routes.QR_CODE, arguments: {
                                'id': controller.resep['id'],
                              });
                            },
                            child: const Iconify(
                              Carbon.scan_alt,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        color: ColorConfig.lightGreyColor,
                        thickness: 0.5,
                      ),
                      const SizedBox(height: 20),
                      const CardContentResep(
                        title: "Daffa Naufal Athallah",
                        subtitle: "No BPJS :",
                        id: "1234567890",
                      ),
                      const SizedBox(height: 40),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Resep oleh :",
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Dr. Endang Suryani",
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: ColorConfig.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        if (controller.resep['obat'] == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (controller.resep['obat'].isEmpty) {
                          return const Center(
                            child: Text(
                              "Tidak ada obat yang diresepkan",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color.fromARGB(255, 27, 27, 27),
                              ),
                            ),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              controller.resep['obat'].length, (index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_OBAT, arguments: {
                                  'id': index.toString(),
                                  'obat': controller.resep['obat'][index],
                                });
                              },
                              child: CardObat(
                                id: index.toString(),
                                nama_obat: controller.resep['obat'][index]
                                    ['nama_obat'],
                                kali_minum: controller.resep['obat'][index]
                                    ['aturan_minum'],
                                aturan_minum: controller.resep['obat'][index]
                                    ['aturan_pakai'],
                                isConfirmed:
                                    controller.resep['status'] == "confirmed"
                                        ? true
                                        : false,
                              ),
                            );
                          }),
                        );
                      }),
                      const SizedBox(height: 20),
                      const Text(
                        "Butuh Bantuan :",
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListMarkdown(
                        title: "Pantangan Pola Makan",
                        content: [
                          "Makanan berlemak jenuh tinggi: Gorengan, makanan cepat saji, dan produk makanan olahan yang menghambat sistem kekebalan tubuh.",
                          "Minuman bersoda dan alkohol: Minuman ini dapat mengganggu penyerapan obat TBC dan memperlambat pemulihan.",
                          "Makanan manis berlebihan: Kue dan permen karena meningkatkan risiko peradangan dan menurunkan imunitas tubuh.",
                        ],
                      ),
                      const SizedBox(height: 20),
                      ListMarkdown(
                        title: "Pantangan Pola Hidup",
                        content: [
                          "Beraktivitas terlalu berat: Aktivitas fisik yang berlebihan dapat membuat tubuh cepat lelah dan memperlambat pemulihan.",
                          "Stres kronis dapat menurunkan daya tahan tubuh, jadi dianjurkan untuk relaksasi seperti meditasi atau pernapasan dalam.",
                          "Merokok: Mengurangi fungsi paru-paru dan memperlambat pemulihan.",
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingBot(),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorConfig.lightGreyColor,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: ButtonMain(
            title: "Konfirmasi",
            onPressed: () {},
            isDisabled: true,
          )),
    );
  }
}
