import 'package:flutter_debug_logger/flutter_debug_logger.dart';

void main() {
  final mockApiResponse = {
    "status": "success",
    "data": {
      "message": "Welcome to Flutter Debug Logger!",
      "user": {"id": 1, "name": "Raihan Sikdar"}
    }
  };

  FlutterDebugLogger.printJsonResponse(
    url: "https://api.example.com/user/info",
    method: Method.GET,
    tag: "UserAPI",
    statusCode: 200,
    responseBody: mockApiResponse,
  );
}
