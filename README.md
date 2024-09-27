# surrealdb_js

[![pub package](https://img.shields.io/pub/v/surrealdb_js.svg?label=surrealdb_js&color=blue)](https://pub.dartlang.org/packages/surrealdb_js)
[![browser tests](https://github.com/limcheekin/surrealdb_js/actions/workflows/browser-tests.yaml/badge.svg)](https://github.com/limcheekin/surrealdb_js/actions/workflows/browser-tests.yaml)
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

The Flutter SurrealDB SDK for JavaScript package is a powerful integration for Flutter, built upon the foundation of [surrealdb.js](https://github.com/surrealdb/surrealdb.js), the official SurrealDB SDK for JavaScript.

## Installation 💻

**❗ In order to start using surrealdb_js you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
flutter pub add surrealdb_js
```

Alternatively, add `surrealdb_js` to your `pubspec.yaml`:

```yaml
dependencies:
  surrealdb_js:
```

Install it:

```sh
flutter pub get
```

Lastly, add the following code before the `</head>` tag in the `web/index.html` file:
```html
<script type="module">
  import { Surreal, StringRecordId } from "/assets/packages/surrealdb_js/assets/js/index.js";
  // expose the type to the global scope
  globalThis.SurrealJS = Surreal;
  globalThis.StringRecordId = StringRecordId;
</script>
```

## ✨ Features

- <input type="checkbox" checked disabled /> [x] `connect()`
- <input type="checkbox" checked disabled /> [x] `close()`
- <input type="checkbox" checked disabled /> [x] `use()`
- <input type="checkbox" checked disabled /> [x] `create()`
- <input type="checkbox" checked disabled /> [x] `update()`
- <input type="checkbox" checked disabled /> [x] `merge()`
- <input type="checkbox" checked disabled /> [x] `delete()`
- <input type="checkbox" checked disabled /> [x] `select()`
- <input type="checkbox" checked disabled /> [x] `query()`
- <input type="checkbox" checked disabled /> [x] `query_raw()`
- <input type="checkbox" checked disabled /> [x] `transaction()`
- <input type="checkbox" checked disabled /> [x] `let()`
- <input type="checkbox" checked disabled /> [x] `unset()`
- <input type="checkbox" checked disabled /> [x] `signup()`
- <input type="checkbox" checked disabled /> [x] `signin()`
- <input type="checkbox" checked disabled /> [x] `invalidate()`
- <input type="checkbox" checked disabled /> [x] `authenticate()`
- <input type="checkbox" checked disabled /> [x] `info()`
- <input type="checkbox" checked disabled /> [x] `patch()`
- <input type="checkbox" checked disabled /> [x] `version()`

## 🏃 Examples

### Basic

```dart
final db = Surreal();

await db.connect('http://127.0.0.1:8000/rpc');
await db.use(namespace: 'surreal', database: 'surreal');
await db.signin({'username': 'root', 'password': 'root'});

final created = db.create('person',
          {
            'title': 'CTO',
            'name': {
              'first': 'Tom',
              'last': 'Jerry',
            },
            'marketing': true,
          },
        );

// created['id'] = person:b9eht8bie8abf0vbcfxh
final id = created['id'].toString();

final merged = await db.merge(
        id,
        {
          'marketing': false,
        },
      );

final tom = await db.select(id);

final deleted = await db.delete(id);
```

For more code examples, kindly refer to the [integration test](https://github.com/limcheekin/surrealdb_js/blob/main/integration_test/surrealdb_js_test.dart) and the [example project](https://github.com/limcheekin/surrealdb_js/blob/main/example/lib/main.dart).

### Transaction Support

```dart
final result = await db.transaction(
  showSql: true,
  (txn) async {
    txn.query('DEFINE TABLE test SCHEMAFULL;');
    txn.query('DEFINE FIELD name ON test TYPE string;');
    txn.query(
      r'CREATE test SET name = $name;',
      bindings: {'name': 'John'},
    );
    if (somethingWrong) {
      txn.cancel();
    }
  },
);
```

For more code examples, kindly refer to the [integration test of transaction](https://github.com/limcheekin/surrealdb_js/blob/main/integration_test/transaction_test.dart).

## 🧑‍💼 Contributing

Contributions are welcome! Please check out the unimplemented features above, issues on the repository, and feel free to open a pull request.
For more information, please see the [contribution guide](CONTRIBUTING.md).

<a href="https://github.com/limcheekin/surrealdb_js/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=limcheekin/surrealdb_js" />
</a>

## 📔 License

This project is licensed under the terms of the MIT license.

## 🗒️ Citation

If you utilize this package, please consider citing it with:

```
@misc{surrealdb_js,
  author = {Lim Chee Kin},
  title = {surrealdb_js: Flutter SurrealDB SDK for JavaScript package},
  year = {2024},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/limcheekin/surrealdb_js}},
}
```

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
