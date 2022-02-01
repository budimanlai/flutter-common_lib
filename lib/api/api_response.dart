part of 'api.dart';

class ApiResponse {
  bool success;
  String message;
  dynamic data;

  ApiResponse.fromJson(Map<String, dynamic> resp)
      : success = resp["status"] == 0,
        message = resp["message"],
        data = resp["data"];
}
