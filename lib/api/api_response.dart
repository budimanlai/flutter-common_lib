part of 'api.dart';

class ApiResponse {
  bool success;
  String message;
  dynamic data;

  ApiResponse.fromJson(Map<String, dynamic> resp)
      : success = resp["success"],
        message = resp["message"] == null ? "" : resp["message"],
        data = resp["data"];
}
