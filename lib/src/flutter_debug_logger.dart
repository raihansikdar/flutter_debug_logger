import 'dart:convert';
import 'dart:developer';

/// An enum representing all standard HTTP methods for type-safe usage in API requests.
enum Method {
  /// HTTP GET method
  GET,

  /// HTTP POST method
  POST,

  /// HTTP PUT method
  PUT,

  /// HTTP DELETE method
  DELETE,

  /// HTTP PATCH method
  PATCH,

  /// HTTP HEAD method
  HEAD,

  /// HTTP OPTIONS method
  OPTIONS,

  /// HTTP TRACE method
  TRACE,

  /// HTTP CONNECT method
  CONNECT,
}

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
  /// Parameters:
  /// - [url]: The full API URL.
  /// - [method]: The HTTP method used (GET, POST, etc). Optional.
  /// - [tag]: A custom tag used to identify this log block.
  /// - [statusCode]: The HTTP status code of the response.
  /// - [responseBody]: The response body, can be a [String], [Map], or [List].
  static void printJsonResponse({
    required String url,

    /// String method = 'N/A',
    Method? method,

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
        prettyJson = '----->> Unsupported response body type: ${responseBody.runtimeType}';
      }

      if (url.isNotEmpty && url != 'N/A') {
        log("----->[$tag] URL         ==> $url");
      }

      // if (method.isNotEmpty && method != 'N/A') {
      //   log("----->[$tag] Method      ==> $method");
      // }

      if (method != null) {
        log("----->[$tag] Method      ==> ${method.name}");
      }

      log("----->[$tag] StatusCode  ==> $statusCode");
      log("----->[$tag] Body        ==> $prettyJson");
    } catch (e) {
      log("----->>[$tag] Failed to parse response body: $e");
    }
  }
}
