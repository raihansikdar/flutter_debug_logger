import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_debug_logger/flutter_debug_logger.dart';

void main() {
  group('FlutterDebugLogger', () {
    test('logs pretty JSON from Map without throwing', () {
      // Arrange
      final response = {
        'success': true,
        'data': [1, 2, 3],
      };

      // Act & Assert
      expect(
        () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: Method.GET,
          tag: 'TEST_MAP',
          statusCode: 200,
          responseBody: response,
        ),
        returnsNormally,
      );
    });

    test('logs pretty JSON from valid JSON string without throwing', () {
      const jsonString = '{"success":true,"data":[1,2,3]}';

      expect(
        () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: Method.POST,
          tag: 'TEST_JSON_STRING',
          statusCode: 201,
          responseBody: jsonString,
        ),
        returnsNormally,
      );
    });

    test('handles unsupported response body types without throwing', () {
      expect(
        () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: Method.PUT,
          tag: 'TEST_UNSUPPORTED_TYPE',
          statusCode: 400,
          responseBody: 42.0, // Unsupported type (double)
        ),
        returnsNormally,
      );
    });

    test('handles invalid JSON string gracefully without throwing', () {
      expect(
        () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: Method.DELETE,
          tag: 'TEST_INVALID_JSON',
          statusCode: 500,
          responseBody: '{invalid json}', // Not a valid JSON
        ),
        returnsNormally,
      );
    });

    test('handles empty string body without throwing', () {
      expect(
        () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: Method.HEAD,
          tag: 'TEST_EMPTY_BODY',
          statusCode: 204,
          responseBody: '',
        ),
        returnsNormally,
      );
    });

    test('handles null body without throwing', () {
      expect(
        () => FlutterDebugLogger.printJsonResponse(
          url: 'https://example.com/api',
          method: Method.OPTIONS,
          tag: 'TEST_NULL_BODY',
          statusCode: 204,
          responseBody: null,
        ),
        returnsNormally,
      );
    });
  });
}
