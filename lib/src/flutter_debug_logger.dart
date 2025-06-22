import 'dart:convert';
import 'dart:developer';

/// A utility class for logging formatted API response data in a clean,
/// Postman-like style using the built-in `log()` function.
class FlutterDebugLogger {
  // Private constructor to prevent instantiation.
  FlutterDebugLogger._();

  /// Logs a pretty-printed JSON API response to the console.
  ///
  /// This method prints the API URL, HTTP method, status code,
  /// and the formatted response body for debugging purposes.
  ///
  /// Example output:
  /// ```
  /// ----->[MyTag] URL         ==> https://example.com/api
  /// ----->[MyTag] Method      ==> GET
  /// ----->[MyTag] StatusCode  ==> 200
  /// ----->[MyTag] Body        ==> {
  ///   "message": "Success"
  /// }
  /// ```
  ///
  /// - [url]: The full API URL.
  /// - [method]: HTTP method used (e.g., 'GET', 'POST').
  /// - [tag]: Custom tag to identify the log block.
  /// - [statusCode]: The HTTP response code.
  /// - [responseBody]: The response data (can be String, Map, or List).

  static void printJsonResponse({
    required String url,
    String method = 'N/A',
    required String tag,
    required int statusCode,
    required dynamic responseBody,
  }) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      String prettyJson;

      if (responseBody is List || responseBody is Map) {
        prettyJson = encoder.convert(responseBody);
      } else if (responseBody is String) {
        final decoded = jsonDecode(responseBody);
        prettyJson = encoder.convert(decoded);
      } else {
        prettyJson =
            '\n----->> Unsupported response body type: ${responseBody.runtimeType}';
      }

      if (url.isNotEmpty && url != 'N/A') {
        log("\n----->[$tag] URL         ==> $url");
      }

      if (method.isNotEmpty && method != 'N/A') {
        log("----->[$tag] Method      ==> $method");
      }

      log("----->[$tag] StatusCode  ==> $statusCode");
      log("----->[$tag] Body        ==> $prettyJson");
    } catch (e) {
      log("\n----->>[$tag] Failed to parse response body: $e");
    }
  }
}
