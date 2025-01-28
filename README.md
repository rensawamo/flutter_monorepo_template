# Layered Architecture with SSOT and Dependency Injection in Flutter


## Build 

### Flavor
Please set up firebase setting

Android: melos_template/android/app/src/YOURFLAVOR/google-services.json


iOS: melos_template/ios/YOURFLAVOR/GoogleService-Info.plist

| environment | Android Package Name         | iOS Bundle Identifier         | App Name      |
|-------------|-------------------------------|--------------------------------|---------------|
| dev         | com.example.melos_template.dev | com.example.melosTemplate.dev | dev.template  |
| stg         | com.example.melos_template.stg | com.example.melosTemplate.stg | stg.template  |
| prod        | com.example.melos_template    | com.example.melosTemplate     | template      |


Install Dependencies
```sh
$ make bs
```

Build command
```sh
$ cd app/melos_template && fvm flutter run --debug --dart-define=flavor=YOURFLAVOR
```

##  Directory

```sh
app/melos_template
packages/
├── di_provider/    
├── foundation/     
├── network/         
├── repository/      
├── service/
├── state/         
├── test_util/      
├── ui/             
├── utility/             
melos.yaml          

```

| **Directory**       | **Description**                                                                                                                                                            |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `di_provider/`       | Defines providers for **Dependency Injection** (DI) using `riverpod_annotation`. It includes configurations for singleton or short-lived objects for DI across the app.   |
| `foundation/`        | Contains **common utilities**, **extensions**, **enumerations**, and **provider logic** that form the core reusable building blocks of the application. This includes helper functions, shared logic, and design patterns that can be applied across different layers of the app. |
| `repository/`       | Handles data access, interacting with external data sources (APIs, databases) and providing data to the service layer.                              |
| `service/`          | Manages business logic and interacts with `repository/` to fetch and process data. It also updates the `store/` to maintain a consistent application state.          |
| `state/`            | Acts as the **Single Source of Truth (SSOT)** for the application state. The `Presentation` layer watches this store to reflect changes in the UI.   |
| `test_util/`        | Contains **utilities for testing**, including Fake implementations of `shared_preferences` and `flutter_secure_storage` for unit and integration tests. These fakes are used to simulate data storage behavior in tests. |
| `ui/`               | Contains **UI components** like screens and widgets used to build the front-end of the application in Flutter.                                                              |
| `core_utility/`     | Provides shared utility functions and helper classes used across the application, such as date formatters.                                                                  |


## Dependency Packages

#### State Management
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): A reactive state management solution that facilitates easy dependency injection.

#### Dependency Injection
- [riverpod_annotation](https://pub.dev/packages/riverpod_annotation): An annotation package that supports dependency injection via code generation. It uses the `@riverpod` annotation to automatically generate providers and ensure type-safe DI.

#### HTTP & Networking
- [dio](https://pub.dev/packages/dio): A powerful HTTP client for Dart, supporting request cancellation, interceptors, retries, and file downloads.

#### JSON Serialization
- [json_serializable](https://pub.dev/packages/json_serializable): Automates the serialization and deserialization of JSON, enabling safe and efficient data parsing through code generation.

#### Local Storage
- [shared_preferences](https://pub.dev/packages/shared_preferences): A key-value store for storing small amounts of local data conveniently.
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage): A package for securely storing sensitive data such as passwords and tokens.

#### Navigation & Routing
- [go_router](https://pub.dev/packages/go_router): A declarative routing package that integrates well with Riverpod. It uses `TypedShellRoute` for type-safe navigation.


#### Code Generation
- [build_runner](https://pub.dev/packages/build_runner): A tool to run code generation tasks, such as managing and executing code generation for `json_serializable` and `riverpod_annotation`.
- [freezed](https://pub.dev/packages/freezed): A code generation library for creating immutable classes and union types. It works in conjunction with `build_runner`.
- [riverpod_generator](https://pub.dev/packages/riverpod_generator): A tool for automatically generating Riverpod providers using code generation, typically used with `build_runner`.
- [retrofit_generator](https://pub.dev/packages/retrofit_generator): A tool for generating Retrofit code, which simplifies API client creation with concise HTTP request definitions.

#### Testing
- [mockito](https://pub.dev/packages/mockito): A library that generates mocks for easy dependency mocking, making unit testing more efficient.

#### Module Management
- [melos](https://pub.dev/packages/melos): A tool for managing monorepo projects, supporting versioning, dependency synchronization, and running scripts across multiple packages.

#### Linter & Code Quality
- [very_good_analysis](https://pub.dev/packages/very_good_analysis): A linter package provided by Very Good Ventures to ensure consistency and improve code quality.

#### Analytics & Crash Reporting
- [firebase_analytics](https://pub.dev/packages/firebase_analytics): A package for tracking in-app events using Firebase Analytics.
- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics): A package for automatically sending crash reports using Firebase Crashlytics.

#### Push Notifications
- [firebase_messaging](https://pub.dev/packages/firebase_messaging): A Firebase service that provides push notifications to devices. It is used to manage notifications within the app, ensuring smooth and reliable messaging between server and mobile users.
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications): A plugin to show local notifications on Android, iOS. It allows the app to display notifications without requiring an internet connection, and is often used in combination with Firebase Messaging to handle notifications when the app is in the foreground.


## GitHub Actions

### Available Workflows:

- **auto_merge_dependabot.yml**: Automatically merges Dependabot PRs after they pass checks.
  
- **bump.yml / bump-pull-request.yml**: These workflows handle the bumping of version numbers for new releases and creating pull requests for version bumps.

- **coding_check.yml**: This workflow runs linter checks, executes tests, and uploads the coverage report. It ensures code style, tests, quality checks, and coverage display are applied before merging. Additionally, if any issues are found, Danger comments the failures directly on the pull request.

  
- **tagging-when-merged.yml**: When a pull request is merged into the main branch, this workflow automatically tags the commit and creates a release note.

- **dependabot.yml**: This is used to configure Dependabot to automatically check for dependency updates and submit PRs.

All these workflows help automate and streamline the development process, ensuring code quality and consistency across pull requests, while also managing versioning and releases.


## Create new package
```sh
$ dart create -t package NAME
```

## Create feature template
```sh
$ mason make feature
```

## Before Submitting a PR
1. Linter Check
Make sure the code adheres to the project's style guidelines by running the linter

```sh
$ melos analyze
```

2. Test Check
Ensure all tests pass successfully before submitting your PR

```sh
$ melos test
```
