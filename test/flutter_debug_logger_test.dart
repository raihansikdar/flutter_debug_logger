import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_debug_logger/flutter_debug_logger.dart';

void main() {
  group('FlutterDebugLogger', () {
    test('should log pretty JSON from Map', () {
      expect(
            () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: 'GET',
          tag: 'TEST',
          statusCode: 200,
          responseBody: {
            'success': true,
            'data': [1, 2, 3],
          },
        ),
        returnsNormally,
      );
    });

    test('should log pretty JSON from JSON string', () {
      const jsonString = '{"success":true,"data":[1,2,3]}';

      expect(
            () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: 'POST',
          tag: 'TEST',
          statusCode: 201,
          responseBody: jsonString,
        ),
        returnsNormally,
      );
    });

    test('should handle unsupported response body types', () {
      expect(
            () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: 'PUT',
          tag: 'TEST',
          statusCode: 400,
          responseBody: 42.0,
        ),
        returnsNormally,
      );
    });

    test('should handle invalid JSON string gracefully', () {
      expect(
            () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: 'DELETE',
          tag: 'TEST',
          statusCode: 500,
          responseBody: '{invalid json}',
        ),
        returnsNormally,
      );
    });
  });
}
