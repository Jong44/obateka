import 'package:flutter/widgets.dart';
import 'package:obateka/app/config/ColorConfig.dart';

class CardContentResep extends StatelessWidget {
  final String title;
  final String subtitle;
  final String id;
  const CardContentResep({
    super.key,
    required this.title,
    required this.subtitle,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13.0,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            id == ""
                ? Expanded(
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: ColorConfig.greyColor,
                      ),
                    ),
                  )
                : Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: ColorConfig.greyColor,
                    ),
                  ),
            const SizedBox(width: 10),
            Text(
              id,
              style: const TextStyle(
                fontSize: 12.0,
                color: ColorConfig.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
