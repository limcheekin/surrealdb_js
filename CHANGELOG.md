# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Each new version will be released following the new version of the [surrealdb.js](https://github.com/surrealdb/surrealdb.js).

Changes to the project are tracked using build numbers behind the version number, denoted as increments such as +1, +2, and so on.

## [Unreleased]

## [1.1.0+9] - 2024-12-23

- Feat: Upgrade surrealdb.js to 1.1.0, ensuring compatibility with surrealdb 2.1.4.

## [1.0.1+7] - 2024-09-27

- Feat: Upgrade surrealdb.js to 1.0.1, ensuring compatibility with surrealdb 2.0.2.

## [1.0.0-beta.20+5] - 2024-09-01

- Feat: Add `query_raw` method.
- Feat: Add `showSql` flag to the `transaction` method.
- Fix: `DateTime` field error in the `query` method with `bindings` by introduce `JSDate` and `JSDateJsonConverter` class.

## [1.0.0-beta.20+4] - 2024-08-17

- Upgraded surrealdb.js to 1.0.0-beta.20.

## [1.0.0-beta.14+3] - 2024-07-16

- Upgraded surrealdb.js to 1.0.0-beta.14.
- Added `info` and `close` method.
- Added `engines` argument to `Surreal` constructor for the `surrealdb_wasm` integration.

## [1.0.0-beta.8+1] - 2024-06-06

- Initial release 🎉
