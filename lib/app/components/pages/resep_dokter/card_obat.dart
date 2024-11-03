import 'package:flutter/material.dart';
import 'package:obateka/app/config/ColorConfig.dart';

class CardObat extends StatelessWidget {
  final String id;
  final String nama_obat;
  final String kali_minum;
  final String aturan_minum;
  final bool isConfirmed;
  const CardObat({
    super.key,
    required this.id,
    required this.nama_obat,
    required this.kali_minum,
    required this.aturan_minum,
    this.isConfirmed = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConfig.lightGreyColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            isConfirmed
                ? const Icon(
                    Icons.check_circle,
                    color: ColorConfig.primaryColor,
                    size: 20,
                  )
                : SizedBox(),
            isConfirmed ? const SizedBox(width: 10) : SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama_obat,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      kali_minum,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: ColorConfig.greyColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      aturan_minum,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: ColorConfig.greyColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: ColorConfig.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
