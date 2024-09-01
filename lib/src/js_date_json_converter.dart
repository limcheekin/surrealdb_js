import 'dart:js_interop';

import 'package:json_annotation/json_annotation.dart';
import 'package:surrealdb_js/src/js_date.dart';

/// A custom JSON converter that facilitates the conversion between Dart
/// `DateTime` objects and JavaScript `Date` objects (`JSDate`) for JSON
/// serialization and deserialization.
///
/// This converter is particularly useful when working with JSON data that
/// includes date-time information and is intended to be interoperable between
/// Dart and JavaScript. It helps bridge the gap between Dart's `DateTime` and
/// JavaScript's `Date` formats during data serialization.
///
/// This converter can be used with the `json_serializable` package to
/// automatically handle the conversion of `DateTime` fields in Dart classes
/// when communicating with JavaScript or a JavaScript-based database.
///
/// ### Example Usage
///
/// ```dart
/// @JsonSerializable()
/// class Event {
///   @JSDateJsonConverter()
///   final DateTime date;
///
///   Event({required this.date});
///
// ignore: lines_longer_than_80_chars
///   factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
///   Map<String, dynamic> toJson() => _$EventToJson(this);
/// }
/// ```
///
/// This will ensure that the `date` field is correctly serialized to and from a
/// JavaScript `Date` object (`JSDate`) when converting between JSON and Dart
/// objects.
///
/// ### See Also
/// - [JsonConverter](https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonConverter-class.html) (json_annotation package)
/// - [JavaScript `Date` object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date) (MDN Web Docs)
class JSDateJsonConverter implements JsonConverter<DateTime, JSDate> {
  /// Creates a new instance of `JSDateJsonConverter`.
  ///
  /// This constructor is a constant constructor, allowing instances of this
  /// converter to be used as compile-time constants in Dart.
  const JSDateJsonConverter();

  /// Converts a JavaScript `Date` object (`JSDate`) to a Dart `DateTime`
  /// object.
  ///
  /// The [jsDate] parameter is expected to be an instance of `JSDate` (a
  /// JavaScript `Date` object). This method extracts the time value (in
  /// milliseconds since the Unix epoch) from the JavaScript `Date` object and
  /// converts it to a Dart `DateTime` in UTC.
  ///
  /// Returns:
  /// A `DateTime` object representing the same point in time as the input
  /// `JSDate`.
  ///
  /// Example:
  /// ```dart
  /// var jsDate = JSDate('2024-09-01');
  /// DateTime dateTime = JSDateJsonConverter().fromJson(jsDate);
  /// print(dateTime); // Output will be a Dart DateTime object.
  /// ```
  @override
  DateTime fromJson(JSDate jsDate) {
    return DateTime.fromMillisecondsSinceEpoch(jsDate.getTime(), isUtc: true);
  }

  /// Converts a Dart `DateTime` object to a JavaScript `Date` object
  /// (`JSDate`).
  ///
  /// The [dateTime] parameter is expected to be an instance of Dart's
  /// `DateTime` class. This method converts the `DateTime` object to an
  /// ISO-8601 string in UTC and then converts it to a JavaScript-compatible
  /// string format for creating a `JSDate`.
  ///
  /// Returns:
  /// A `JSDate` object representing the same point in time as the input
  /// `DateTime`.
  ///
  /// Example:
  /// ```dart
  /// DateTime dateTime = DateTime.now();
  /// JSDate jsDate = JSDateJsonConverter().toJson(dateTime);
  /// print(jsDate); // Output will be a JavaScript Date object.
  /// ```
  @override
  JSDate toJson(DateTime dateTime) {
    return JSDate(dateTime.toUtc().toIso8601String().toJS);
  }
}
