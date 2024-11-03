import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/config/ColorConfig.dart';
import 'package:obateka/app/controllers/detail-controllers/chat_bot_controller.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatBotController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Teka',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          controller: controller.scrollController.value,
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: controller.messages[index].role != 'user'
                  ? Alignment.topLeft
                  : Alignment.topRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: controller.messages[index].role != 'assistant'
                      ? ColorConfig.primaryColor
                      : ColorConfig.lightGreyColor,
                  borderRadius: controller.messages[index].role != 'assistant'
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                ),
                child: Text(
                  controller.messages[index].message,
                  style: TextStyle(
                    fontSize: 14,
                    color: controller.messages[index].role != 'assistant'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: ColorConfig.lightGreyColor,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.messageController,
                style: const TextStyle(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: ColorConfig.lightGreyColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: ColorConfig.greyColor,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                controller.sendMessage();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorConfig.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
