import 'package:flutter/material.dart';
import 'package:obateka/app/config/ColorConfig.dart';

class ListMarkdown extends StatelessWidget {
  final String title;
  final List<String> content;
  const ListMarkdown({
    super.key,
    required this.title,
    required this.content,
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
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            content.length,
            (index) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "•",
                        style: const TextStyle(
                          fontSize: 13.0,
                          color: ColorConfig.greyColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          content[index],
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: ColorConfig.greyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
