import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obateka/app/components/global/floating_bot.dart';
import 'package:obateka/app/components/global/list_markdown.dart';
import 'package:obateka/app/components/pages/resep_dokter/card_content_resep.dart';
import 'package:obateka/app/config/ColorConfig.dart';

class DetailObatPage extends StatelessWidget {
  const DetailObatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resep Obat',
          style: TextStyle(
            fontSize: 18,
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
                    'Detail Obat',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardContentResep(
                        title: "Ambroxol",
                        subtitle: "Ambroxol 30 mg",
                        id: "",
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Info Resep Ringkas",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CardContentResep(
                        title: "Indikasi Penggunaan",
                        subtitle:
                            "Ambroxol digunakan untuk mengatasi batuk dengan cara melarutkan dan mengeluarkan dahak yang ada di saluran pernapasan., Ambroxol digunakan untuk mengatasi batuk dengan cara melarutkan dan mengeluarkan dahak yang ada di saluran pernapasan.",
                        id: "",
                      ),
                      const SizedBox(height: 10),
                      ListMarkdown(
                        title: "Dosis/Pentujuk Penggunaan",
                        content: [
                          "Dewasa: 1 tablet 3 kali sehari",
                          "Anak-anak: 1/2 tablet 3 kali sehari",
                        ],
                      ),
                      const SizedBox(height: 10),
                      CardContentResep(
                        title: "Administasi",
                        subtitle: "Sebaiknya diminum bersama makanan",
                        id: "",
                      ),
                      const SizedBox(height: 10),
                      CardContentResep(
                        title: "Tindakan Pencegahan Khusus",
                        subtitle:
                            "Hindari penggunaan bersamaan dengan obat batuk lain yang mengandung kodein atau obat-obat yang menekan batuk.",
                        id: "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingBot(),
    );
  }
}
