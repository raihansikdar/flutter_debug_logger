import 'dart:convert';
import 'dart:developer';


class FlutterDebugLogger {

  FlutterDebugLogger._();

  static printJsonResponse({
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
        prettyJson = '-->Unsupported response body type: ${responseBody.runtimeType}';
      }

      if (url.isNotEmpty && url != 'N/A') {
        log("----->[$tag] URL         ==> $url");
      }

      if (method.isNotEmpty && method != 'N/A') {
        log("----->[$tag] Method      ==> $method");
      }

      log("----->[$tag] StatusCode  ==> $statusCode");
      log("----->[$tag] Body        ==> $prettyJson");
    } catch (e) {
      log("------->>[$tag] Failed to parse response body: $e");
    }
  }
}