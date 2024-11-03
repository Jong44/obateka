import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/routes/app_router.dart';

class FloatingBot extends StatelessWidget {
  const FloatingBot({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Get.toNamed(Routes.CHAT_BOT);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30, right: 20),
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Image.asset(
          'assets/icons/chat-bot.png',
          width: 40,
        ),
      ),
    );
  }
}
