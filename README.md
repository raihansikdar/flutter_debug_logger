# flutter_debug_logger

`flutter_debug_logger` is a lightweight and developer-friendly Flutter utility package for logging API responses in a clean, Postman-like style.
It pretty-prints JSON and adds status emojis, making your console logs more structured and readable while debugging REST APIs.
---

## 🚀 Features

- ✅ Pretty JSON Logging – Beautifies Map, List, or JSON String responses
- ✅ Custom Tags – Easily identify logs with tag values
- ✅ HTTP Method Logging – Log request method (GET, POST, PUT, etc.)
- ✅ Status Emojis – Visual status indicators (✅, ⚠️, ❌) based on status code
- ✅ Safe & Error-Handled – Handles invalid JSON, null/empty bodies, and unsupported types gracefully
- ✅ Zero Dependencies – Simple and efficient with no external dependencies

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_debug_logger: ^2.1.0

```

## 🧩 Getting Started
Simply import the package in your Dart file:
```
import 'package:flutter_debug_logger/flutter_debug_logger.dart';

```

## ✅ Usage Example
```
FlutterDebugLogger.printJsonResponse(
  url: 'https://api.example.com/product',
  method: Method.GET,
  tag: 'PRODUCT_API',
  statusCode: response.statusCode,
  responseBody: response.body,
);

```

## 🧪 Example Output

```
═══════════════ 📦 [PRODUCT_API] API DEBUG LOG START ═══════════════
----->[PRODUCT_API] URL         ==> https://api.example.com/product
----->[PRODUCT_API] Method      ==> GET
----->[PRODUCT_API] StatusCode  ==> 200 ✅
----->[PRODUCT_API] Body        ==> {
  "success": true,
  "product": {
    "id": 101,
    "name": "Wireless Headphones",
    "price": 59.99,
    "in_stock": true,
    "categories": [
      "Electronics",
      "Audio"
    ],
    "rating": {
      "average": 4.5,
      "count": 234
    }
  }
}
═══════════════ 🛑 [PRODUCT_API] API DEBUG LOG END   ═══════════════


```

## ⚠️ Error Handling

- flutter_debug_logger will never crash your app when encountering unexpected data:
- Null or empty body → Logs ℹ️ No Content
- HTTP 204 → Logs ℹ️ No Content (204 response)
- Invalid JSON string → Logs raw string as-is
- Unsupported types → Logs a fallback message like:

```
---->> ⚠️ Unsupported response body type: double
or
---->> [TAG] Failed to parse response body: FormatException...

```

## 🧠 Why Use This Package?
1. Simplifies API debugging
2. Makes log outputs human-readable 
3. Visual cues for response success/warning/error
4. Works with both JSON strings and structured data 
5. Clearly separates logs by tag and request method
6. Safe from crashes or formatting exceptions


## 🆕 What’s New (v2.1.0)

- 🎨 **Added status emojis** for quick status recognition (`✅` success, `⚠️` warning, `❌` error, `ℹ️` info)
- 📝 **Improved DartDoc** for both `Method` enum and `FlutterDebugLogger` class
- 🛡 **Enhanced error handling** for:
    - Null responses
    - Empty string bodies
    - Invalid or malformed JSON
    - HTTP 204 No Content responses
- 📦 **Added log block markers** for start/end to make console logs **Postman-like**
- ⚡ **Fallback handling** for unsupported types (logs type warning instead of crashing)


## 🔄 Migration Notes
- If you previously passed raw string bodies, they are now safely logged even if not valid JSON
- Start and end separators are automatically added to make logs visually clearer
- JSON strings are pretty-printed with indentation by default


## 👤 Author

**Raihan Sikdar**  
 
Website: [raihansikdar.com](https://raihansikdar.com)  
Email: raihansikdar10@gmail.com  
GitHub: [raihansikdar](https://github.com/raihansikdar)  
LinkedIn: [raihansikdar](https://www.linkedin.com/in/raihansikdar/)


## License
This project is licensed under the MIT License. See the LICENSE file for more details.

```text
MIT License

Copyright (c) 2025 Raihan Sikdar

Permission is hereby granted, free of charge, to any person obtaining a copy...