// ignore_for_file: public_member_api_docs
import 'dart:js_interop';

/// Flutter SurrealDB SDK for JavaScript
// REF: https://dart.dev/interop/js-interop/usage#interop-type-members

extension type SurrealJS._(JSObject _) implements JSObject {
  external SurrealJS([JSAny? engines]);
  external JSPromise connect(String endpoint, [JSAny? opts]);
  external JSPromise close();
  external JSPromise use(JSAny? value);
  external JSPromise let(String key, JSAny? value);
  external JSPromise unset(String key);
  external JSPromise<JSAny?> signup(JSAny? credentials);
  external JSPromise<JSAny?> signin(JSAny? credentials);
  external JSPromise invalidate();
  external JSPromise authenticate(String token);
  external JSPromise<JSAny?> info();
  external JSPromise<JSAny?> query(String sql, [JSAny? bindings]);
  external JSPromise<JSAny?> select(JSAny resource);
  external JSPromise<JSAny?> create(JSAny resource, JSAny? data);
  external JSPromise<JSAny?> update(JSAny resource, JSAny? data);
  external JSPromise<JSAny?> merge(JSAny resource, JSAny? data);
  external JSPromise<JSAny?> patch(JSAny resource, JSAny? data);
  external JSPromise<JSAny?> delete(JSAny resource);
  external JSPromise<JSAny?> version();
}

extension type StringRecordId._(JSObject _) implements JSObject {
  external StringRecordId(String id);
}
