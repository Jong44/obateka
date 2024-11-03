import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obateka/app/config/ColorConfig.dart';

class CheckMain extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  const CheckMain({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            onChanged(value);
          },
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color:
                  value == groupValue ? ColorConfig.primaryColor : Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              shape: BoxShape.circle,
            ),
            child: value == groupValue
                ? const Icon(
                    Icons.check,
                    size: 12,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
