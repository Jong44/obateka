import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/config/ColorConfig.dart';
import 'package:obateka/app/routes/app_router.dart';

class CardRiwayatObat extends StatelessWidget {
  final String id;
  final String nama_obat;
  final String tanggal;
  final String rumah_sakit;
  const CardRiwayatObat({
    super.key,
    required this.id,
    required this.nama_obat,
    required this.tanggal,
    required this.rumah_sakit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/icons/medicine.png'),
          title: Row(
            children: [
              Text(
                nama_obat,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                '#$id $tanggal',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: ColorConfig.primaryColor,
                ),
              ),
            ],
          ),
          subtitle: Text(
            rumah_sakit,
            style: const TextStyle(
              fontSize: 12.0,
              color: ColorConfig.greyColor,
            ),
          ),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          selectedTileColor: Colors.transparent,
          selectedColor: Colors.transparent,
          onTap: () {
            Get.toNamed(
              Routes.RESEP_OBAT,
              arguments: {
                'id': id,
              },
            );
          },
        ),
        const Divider(
          thickness: 0.5,
          color: ColorConfig.greyColor,
        ),
      ],
    );
  }
}
