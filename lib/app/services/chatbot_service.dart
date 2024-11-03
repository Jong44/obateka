import 'dart:convert';

import 'package:obateka/app/models/chatbot_model.dart';
import 'package:http/http.dart' as http;
import 'package:obateka/app/models/response_model.dart';

class ChatbotService {
  final base_url = 'https://teka-api.vercel.app/api';

  Future<ResponseModel> getMessage(String threadId) async {
    try {
      final response = await http.get(
        Uri.parse('$base_url/chatbot?threadId=$threadId'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ResponseModel(
          message: 'Success',
          status: true,
          data: data,
        );
      } else {
        return ResponseModel(
          message: 'Failed to load data',
          status: false,
          data: <ChatbotModel>[],
        );
      }
    } catch (e) {
      return ResponseModel(
        message: 'Failed to load data $e',
        status: false,
        data: <ChatbotModel>[],
      );
    }
  }

  Future<ResponseModel> sendMessage(String threadId, String message) async {
    try {
      final response = await http.post(
        Uri.parse('$base_url/chatbot'),
        body: {
          'threadId': threadId,
          'message': message,
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ResponseModel(
          message: 'Success',
          status: true,
          data: data,
        );
      } else {
        return ResponseModel(
          message: 'Failed to send message',
          status: false,
          data: <ChatbotModel>[],
        );
      }
    } catch (e) {
      return ResponseModel(
        message: 'Failed to send message $e',
        status: false,
        data: <ChatbotModel>[],
      );
    }
  }

  Future createThread() async {
    try {
      final response = await http.post(
        Uri.parse('$base_url/thread'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ResponseModel(
          message: 'Success',
          status: true,
          data: data,
        );
      } else {
        return ResponseModel(
          message: 'Failed to create thread',
          status: false,
          data: <ChatbotModel>[],
        );
      }
    } catch (e) {
      return ResponseModel(
        message: 'Failed to create thread $e',
        status: false,
        data: <ChatbotModel>[],
      );
    }
  }
}
