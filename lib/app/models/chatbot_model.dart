class ChatbotModel {
  final String message;
  final String role;

  ChatbotModel({
    required this.message,
    required this.role,
  });

  factory ChatbotModel.fromJson(Map<String, dynamic> json) {
    return ChatbotModel(
      message: json['message'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'role': role,
    };
  }
}
