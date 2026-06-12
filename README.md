# Week 14 - Testing & Quality Assurance Apps

This repository contains four Flutter applications focused on testing and quality assurance practices, covering unit testing, widget testing, integration testing (planned), and error handling & logging (planned).

---

# 1. Unit Tests App (`unit_tests_app`)

## Overview

This application focuses on unit testing business logic, model classes, provider methods, and utility functions using Flutter’s testing framework and Mockito for dependency mocking.

## Features

* Model class testing
* `toJson()` and `fromJson()` testing
* Provider method testing
* Utility function testing
* Validation function testing
* Dependency mocking using Mockito
* Code coverage generation (target: 80%)

## Technologies Used

* Flutter
* Dart
* flutter_test
* mockito

## Running Tests

```bash id="u8k1p3"
flutter test
```

## Coverage Report

```bash id="v2m9xq"
flutter test --coverage
```

## Purpose

To ensure application business logic is correct, stable, and independent of UI and external services.

---

# 2. Widget Tests App (`widget_tests_app`)

## Overview

This application focuses on widget testing to validate UI behavior, user interactions, navigation, and state changes using Flutter’s WidgetTester.

## Features

* Widget rendering tests
* Button interaction testing
* Form validation testing
* Navigation testing
* State change verification
* Custom widget testing

## Technologies Used

* Flutter
* Dart
* flutter_test

## Key Testing Methods

```dart id="q9w2ld"
tester.tap();
tester.enterText();
tester.pump();
tester.pumpAndSettle();
find.byType();
find.text();
```

## Running Tests

```bash id="c7r4mk"
flutter test
```

## Purpose

To ensure UI components behave correctly under different user interactions and states.

---

# 3. Integration Tests App (`integration_tests_app`) - Planned

## Overview

This application is intended for end-to-end integration testing of complete user flows across the application.

## Planned Features

* Login flow testing
* Signup flow testing
* Cart and checkout flow testing
* Navigation flow testing
* Data persistence testing
* Real device/emulator testing

## Technologies (Planned)

* integration_test
* Flutter testing tools
* Emulator and physical device testing

## Purpose

To validate complete application workflows from start to finish in a real-world environment.

---

# 4. Error Handling & Logging App (`error_handling_logging`) - Planned

## Overview

This application is intended to implement centralized error handling and logging using Firebase Crashlytics and custom error management strategies.

## Planned Features

* Global error handling
* Try-catch implementation for async operations
* Firebase Crashlytics integration
* Custom error widgets
* Offline error handling
* Retry mechanisms
* User-friendly error messages

## Technologies (Planned)

* Firebase Crashlytics
* Flutter error handling APIs
* Dart exception handling

## Purpose

To improve application stability, reliability, and user experience by handling and tracking errors effectively.

---

# Summary

| App                    | Status    | Focus                      |
| ---------------------- | --------- | -------------------------- |
| unit_tests_app         | Completed | Business logic testing     |
| widget_tests_app       | Completed | UI and interaction testing |
| integration_tests_app  | Planned   | End-to-end testing         |
| error_handling_logging | Planned   | Crash handling and logging |
