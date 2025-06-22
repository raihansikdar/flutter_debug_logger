# flutter_debug_logger

`flutter_debug_logger` is a lightweight and easy-to-use Flutter utility package designed to simplify API response logging by **pretty-printing JSON** in your debug console. This is ideal for developers who want clean, structured, and readable logs when debugging RESTful APIs.

---

## 🚀 Features

- ✅ **Pretty Prints JSON**: Beautiful indentation for `Map`, `List`, or raw JSON `String` responses
- ✅ **Custom Tagging**: Identify logs using custom `tag` values
- ✅ **HTTP Method Logging**: Optionally include request methods (`GET`, `POST`, etc.)
- ✅ **Error-Safe Logging**: Handles invalid JSON or unexpected types gracefully
- ✅ **Zero Dependencies**: Simple, efficient, and lightweight

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_debug_logger: ^1.0.2

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
  method: 'GET',
  tag: 'PRODUCT_API',
  statusCode: response.statusCode,
  responseBody: response.body,
);

```

## 🧪 Example Output

```
----->[PRODUCT_API] URL         ==> https://api.example.com/product
----->[PRODUCT_API] Method      ==> GET
----->[PRODUCT_API] StatusCode  ==> 200
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

```

## ⚠️ Error Handling
Invalid JSON strings or unsupported types (like int, double, bool) won't crash your app. The logger will print a fallback message such as:
```
----->> Unsupported response body type: double
or
----->>[TAG] Failed to parse response body: FormatException...
```

## 🧠 Advantages
1. Simplifies API debugging
2. Makes log outputs human-readable 
3. Works with both JSON strings and structured data 
4. Helps separate logs by tag and method 
5. Safe from crashes or formatting exceptions

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

```text
MIT License

Copyright (c) 2025 Raihan Sikdar

Permission is hereby granted, free of charge, to any person obtaining a copy...