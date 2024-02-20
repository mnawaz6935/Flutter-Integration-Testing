# Flutter Integration Testing

## Introduction

Flutter Integration Testing allows you to test your Flutter app as a whole by simulating real user interactions. This helps verify that different components work together as expected. These tests run on real devices or emulators, ensuring reliable app performance.

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Running Tests](#running-tests)
- [Writing Tests](#writing-tests)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)
- [References](#references)

---

## Prerequisites

- Flutter SDK installed(Latest) ([Installation Guide](https://flutter.dev/docs/get-started/install))
- A physical device or emulator configured
- `flutter_driver` or `integration_test` package

---

## Setup

### 1. Add Dependencies

Add the following dependencies in `pubspec.yaml`:

```yaml
dev_dependencies:
  integration_test:
    sdk: flutter
  flutter_test:
    sdk: flutter
```

### 2. Enable Integration Testing

Ensure you have an `integration_test` directory in the root of your project. Create test files inside this folder.

Example directory structure:

```
my_flutter_app/
│── lib/
│── test/
│── integration_test/
│   ├── app_test.dart
│── pubspec.yaml
```

---

## Running Tests

### 1. Run Tests on a Device or Emulator

Use the following command to execute integration tests:

```sh
flutter test integration_test/app_test.dart
```

For running on a specific device:

```sh
flutter test integration_test/app_test.dart --flavor staging -d emulator-5554
```

For web testing:

```sh
flutter test --platform chrome integration_test/app_test.dart
```

---

## Writing Tests

### 1. Import Necessary Packages

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:my_flutter_app/main.dart'; // Adjust based on your project structure
```

### 2. Set Up Integration Test

```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App startup test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Welcome'), findsOneWidget);
  });
}
```

### 3. Simulating User Interaction

Simulate taps, text input, and scrolling:

```dart
testWidgets('Login screen test', (tester) async {
  await tester.pumpWidget(MyApp());

  await tester.enterText(find.byType(TextField), 'testuser');
  await tester.tap(find.byKey(Key('loginButton')));
  await tester.pump();

  expect(find.text('Dashboard'), findsOneWidget);
});
```

---

## Best Practices

- **Use Finders**: Use `find.byType()`, `find.byKey()`, and `find.text()` to locate widgets.
- **Wait for UI Updates**: Use `await tester.pump()` or `await tester.pumpAndSettle()` to wait for animations to complete.
- **Structure Test Files**: Keep related tests in the same file and organize them into multiple test cases.
- **Automate Testing**: Run integration tests as part of your CI/CD pipeline.

---

## Troubleshooting

### 1. No Tests Running?

Ensure the test file is inside the `integration_test/` directory.

### 2. Errors Due to Animations?

Use:

```dart
await tester.pumpAndSettle();
```

### 3. Permission Issues on iOS?

Run:

```sh
flutter build ios --no-codesign
```

Then, open Xcode and allow necessary permissions.

---

## References

- [Flutter Integration Testing Guide](https://flutter.dev/docs/testing/integration-tests)
- [Flutter Test Package](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html)
