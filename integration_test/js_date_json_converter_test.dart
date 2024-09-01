import 'dart:js_interop';

import 'package:flutter_test/flutter_test.dart';
import 'package:surrealdb_js/src/js_date.dart';
import 'package:surrealdb_js/src/js_date_json_converter.dart';

void main() {
  group('JSDateJsonConverter', () {
    const converter = JSDateJsonConverter();

    test('fromJson converts JSDate to DateTime correctly', () {
      // Create a JSDate representing '2024-09-01T00:00:00.000Z'.
      final jsDate = JSDate('2024-09-01T00:00:00.000Z'.toJS);

      // Convert JSDate to DateTime using the converter.
      final dateTime = converter.fromJson(jsDate);

      // Check if the converted DateTime is correct.
      // ignore: avoid_redundant_argument_values
      expect(dateTime, DateTime.utc(2024, 9, 1));
    });

    test('toJson converts DateTime to JSDate correctly', () {
      // Create a DateTime instance.
      // ignore: avoid_redundant_argument_values
      final dateTime = DateTime.utc(2024, 9, 1);

      // Convert DateTime to JSDate using the converter.
      final jsDate = converter.toJson(dateTime);

      // Check if the JSDate represents the correct date.
      expect(
        jsDate.getTime(),
        JSDate('2024-09-01T00:00:00.000Z'.toJS).getTime(),
      );
    });

    test('toJson handles non-UTC DateTime correctly', () {
      // Create a non-UTC DateTime instance.
      final dateTime = DateTime(2024, 9, 1, 12, 30, 45);

      // Convert DateTime to JSDate using the converter.
      final jsDate = converter.toJson(dateTime);

      // Convert the JSDate back to DateTime for comparison.
      final convertedDateTime = converter.fromJson(jsDate);

      // Check if the time values match after conversion.
      expect(convertedDateTime, dateTime.toUtc());
    });
  });
}
