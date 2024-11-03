import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:obateka/app/config/ColorConfig.dart';

class ButtonMain extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isDisabled;
  const ButtonMain({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 45),
        backgroundColor:
            isDisabled ? ColorConfig.greyColor : ColorConfig.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        if (!isDisabled) {
          onPressed();
        }
      },
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
