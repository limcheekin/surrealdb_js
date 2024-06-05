# Example

The steps to run the Flutter SurrealDB SDK for JavaScript Example.

## Install SurrealDB
Please refer to the official guide to [install SurrealDB on Linux](https://surrealdb.com/docs/surrealdb/installation/linux).

## Start SurrealDB
Start the SurrealDB with the `./start_surreal.sh` script.

## Run the App in Development Mode
Start the app in development mode:
```bash
flutter run -d chrome
```

## Build with Wasm and Run the App
Build a web application with Wasm:
```bash
flutter build web --wasm
```

Run the app with Python HTTP server at port 8001:
```
./httpserver.sh
```

For production deployment, please refer to [the Wasm documentation](https://docs.flutter.dev/platform-integration/web/wasm) for more information.