import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obateka/app/models/chatbot_model.dart';
import 'package:obateka/app/services/chatbot_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatBotController extends GetxController {
  var messages = <ChatbotModel>[].obs;
  var messageController = TextEditingController();
  var threadId = ''.obs;
  SharedPreferences? prefs;
  var scrollController = ScrollController().obs;
  var isLoading = false.obs;

  void init() async {
    isLoading.value = true;
    prefs = await SharedPreferences.getInstance();
    final thread_id = prefs!.getString('thread_id') ?? '';
    if (thread_id.isEmpty) {
      final response = await ChatbotService().createThread();
      if (response.status) {
        threadId.value = response.data['data']['id'];
        prefs!.setString('thread_id', response.data['data']['id']);
      }
    } else {
      threadId.value = thread_id;
    }
    getMessage();
    isLoading.value = false;
    print(threadId.value);
  }

  void getMessage() async {
    final response =
        await ChatbotService().getMessage(threadId.value.toString());
    if (response.status) {
      messages.value = response.data['data'].map<ChatbotModel>((e) {
        return ChatbotModel.fromJson(e);
      }).toList();
    }
    _scrollToBottom();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    init();
  }

  void _scrollToBottom() {
    scrollController.value.animateTo(
      scrollController.value.position.maxScrollExtent + 1500,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void sendMessage() async {
    Get.snackbar(
      'Info',
      'Sending message...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      showProgressIndicator: true,
      duration: const Duration(seconds: 7),
    );
    final message = messageController.text;
    if (message.isNotEmpty) {
      messageController.clear();
      final response = await ChatbotService().sendMessage(
        threadId.value.toString(),
        message,
      );
      if (response.status) {
        getMessage();
      }
    } else {
      Get.snackbar(
        'Error',
        'Message cannot be empty',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
