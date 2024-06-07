# Real Estate App

Flutter Engineer Translation Test

---

## Demo ▶️

| Android                                                                                                                                | iOS                                                                                                                                 |
|----------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/bukunmialuko/real_estate_flutter/blob/main/doc/emulator-screen-recording.gif" alt="Android" width="400"/> | <img src="https://github.com/bukunmialuko/real_estate_flutter/blob/main/doc/simulator-screen-recording.gif" alt="iOS" width="400"/> |

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the
following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

---

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.
