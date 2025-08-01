import 'dart:convert';
import 'dart:developer';

/// An enum representing all standard HTTP methods for type-safe usage in API requests.
///
/// This provides type safety when specifying HTTP methods for
/// networking requests instead of using raw strings.
///
/// Example:
/// ```dart
/// final method = Method.POST;
/// ```
enum Method {
  /// HTTP GET method – used to retrieve data from the server.
  GET,

  /// HTTP POST method – used to submit data to the server.
  POST,

  /// HTTP PUT method – used to update data on the server.
  PUT,

  /// HTTP DELETE method – used to remove data from the server.
  DELETE,

  /// HTTP PATCH method – used to partially update existing data.
  PATCH,

  /// HTTP HEAD method – used to retrieve headers only, without the response body.
  HEAD,

  /// HTTP OPTIONS method – used to query supported request methods and capabilities.
  OPTIONS,

  /// HTTP TRACE method – used to perform a diagnostic trace of the request.
  TRACE,

  /// HTTP CONNECT method – used to establish a tunnel to the server.
  CONNECT,
}

/// A utility class for logging formatted API response data in a clean,
/// Postman-like style using the built-in `log()` function.
///
/// This class is helpful during development for debugging network responses
/// and ensures consistent logging across the application.
///
/// Example usage:
/// ```dart
/// FlutterDebugLogger.printJsonResponse(
///   url: 'https://api.example.com/users',
///   method: Method.GET,
///   tag: 'UserAPI',
///   statusCode: 200,
///   responseBody: {'name': 'John Doe'},
/// );
/// ```
class FlutterDebugLogger {
  /// Private constructor to prevent instantiation.
  FlutterDebugLogger._();

  /// Logs a pretty-printed JSON API response to the console.
  ///
  /// Displays:
  /// - The API URL
  /// - The HTTP method (if provided)
  /// - The HTTP status code with an emoji for success/warning/error
  /// - A formatted JSON response body or a message if empty
  ///
  /// [url] The endpoint that was called.
  ///
  /// [method] The HTTP method used (GET, POST, etc.).
  ///
  /// [tag] A short identifier for the log, e.g., "LoginAPI" or "UserService".
  ///
  /// [statusCode] The HTTP status code returned by the API.
  ///
  /// [responseBody] The response body from the API.
  /// Can be a `Map`, `List`, `String`, or `null`.
  ///
  /// ### Example:
  /// ```dart
  /// FlutterDebugLogger.printJsonResponse(
  ///   url: 'https://api.example.com/login',
  ///   method: Method.POST,
  ///   tag: 'LoginAPI',
  ///   statusCode: 201,
  ///   responseBody: '{"success": true}',
  /// );
  /// ```
  static void printJsonResponse({
    required String url,
    Method? method,
    required String tag,
    required int statusCode,
    required dynamic responseBody,
  }) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      String prettyJson;

      // Handle different response body cases
      if (statusCode == 204) {
        prettyJson = 'ℹ️ No Content (204 response)';
      } else if (responseBody == null) {
        prettyJson = 'ℹ️ No Content';
      } else if (responseBody is List || responseBody is Map) {
        prettyJson = encoder.convert(responseBody);
      } else if (responseBody is String) {
        if (responseBody.trim().isEmpty) {
          prettyJson = 'ℹ️ No Content';
        } else {
          try {
            final decoded = jsonDecode(responseBody);
            prettyJson = encoder.convert(decoded);
          } catch (_) {
            prettyJson = responseBody; // Not a JSON string, log as-is
          }
        }
      } else {
        prettyJson =
            '---->> ⚠️ Unsupported response body type: ${responseBody.runtimeType}';
      }

      // Add status emoji based on response category
      final statusEmoji = statusCode >= 200 && statusCode < 300
          ? '✅'
          : statusCode >= 400 && statusCode < 500
          ? '⚠️'
          : statusCode >= 500
          ? '❌'
          : 'ℹ️';

      // Print formatted log to the console
      log("═══════════════ 📦 [$tag] API DEBUG LOG START ═══════════════");

      if (url.isNotEmpty && url != 'N/A') {
        log("----->[$tag] URL         ==> $url");
      }

      if (method != null) {
        log("----->[$tag] Method      ==> ${method.name}");
      }

      log("----->[$tag] StatusCode  ==> $statusCode $statusEmoji");
      log("----->[$tag] Body        ==> $prettyJson");

      log("═══════════════ 🛑 [$tag] API DEBUG LOG END   ═══════════════");
    } catch (e) {
      log("---->>[$tag] Failed to parse response body: $e");
    }
  }
}
