import 'dart:js_interop';

/// A JavaScript interop class that provides access to the JavaScript `Date`
/// objects.
///
/// This class allows Dart code to create and manipulate JavaScript `Date`
/// objects by using the `JSDate` extension type. It includes constructor for
/// creating a new date from a string and a method for retrieving the time
/// value of the date in milliseconds since the Unix epoch
/// (January 1, 1970, 00:00:00 UTC).
///
/// Example usage:
/// ```dart
/// // Create a new JSDate from a string representation of a date.
/// var jsDate = JSDate('2024-09-01');
///
/// // Get the time in milliseconds since the Unix epoch.
/// var timeInMillis = jsDate.getTime();
/// ```
///
@JS('Date')
extension type JSDate._(JSObject _) implements JSObject {
  /// Creates a new JavaScript `Date` object from the provided [dateString].
  ///
  /// The [dateString] is a string representation of a date. This constructor
  /// wraps the JavaScript `Date` constructor, allowing for direct interop with
  /// JavaScript `Date` class.
  external JSDate(JSString dateString);

  /// Returns the time value of the JavaScript `Date` object in milliseconds
  /// since the Unix epoch (January 1, 1970, 00:00:00 UTC).
  ///
  /// This method wraps the JavaScript `Date.prototype.getTime()` method,
  /// providing the time in milliseconds.
  ///
  /// Example:
  /// ```dart
  /// var jsDate = JSDate('2024-09-01');
  /// int timeInMillis = jsDate.getTime();
  /// ```
  external int getTime();
}
