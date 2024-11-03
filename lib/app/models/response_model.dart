class ResponseModel {
  final String message;
  final bool status;
  final dynamic data;

  ResponseModel({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'],
      status: json['status'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'data': data,
    };
  }
}
