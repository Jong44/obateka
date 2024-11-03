import 'package:get/get.dart';
import 'package:obateka/app/controllers/detail-controllers/chat_bot_controller.dart';

class ChatBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatBotController>(() => ChatBotController());
  }
}
