import 'dart:js_interop';

import 'package:json_annotation/json_annotation.dart';
import 'package:surrealdb_js/src/js_date.dart';

class JSDateJsonConverter implements JsonConverter<DateTime, JSDate> {
  const JSDateJsonConverter();

  @override
  DateTime fromJson(JSDate jsDate) {
    return DateTime.fromMillisecondsSinceEpoch(jsDate.getTime());
  }

  @override
  JSDate toJson(DateTime dateTime) {
    return JSDate(dateTime.toUtc().toIso8601String().toJS);
  }
}
