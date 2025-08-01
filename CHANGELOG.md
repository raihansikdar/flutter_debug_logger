# Changelog

## [2.1.0] - 2025-08-01
### Added
- Added **status emoji** (`✅`, `⚠️`, `❌`, `ℹ️`) in logs based on HTTP status code category.
- Added **log block start/end separators** for cleaner, Postman-like debugging logs.
- Added handling for:
    - `null` response body
    - Empty string response body
    - HTTP 204 No Content responses with a clear message
    - Non-JSON string response bodies (logs them as raw string)
    - Unsupported types with a warning message

### Changed
- `printJsonResponse` now pretty-prints valid JSON strings and handles non-JSON gracefully.
- Logs now include **start/end markers** for better readability.
- Refactored code for **safer error handling** using `try-catch` for `jsonDecode`.
- Improved `Method` enum documentation and usage examples.

### Fixed
- Fixed crash when response body was empty, null, or contained invalid JSON.
- Fixed potential runtime errors when decoding non-JSON response strings.

---

> **Migration Note:**  
> If you previously passed raw string bodies, the logger will now safely handle invalid JSON instead of throwing an exception.
