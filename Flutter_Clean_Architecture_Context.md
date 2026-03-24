# Flutter Project Context: Clean Architecture with Riverpod & GoRouter

## 1. Project Overview
This project follows a strict **Clean Architecture** pattern to ensure testability, scalability, and separation of concerns. It transitions from an iOS/Swift development mindset (Combine/SwiftUI/Coordinator) into the Flutter ecosystem using **Riverpod**.

## 2. Layer Definitions
- **Domain Layer**: The "Truth". Contains pure Dart Entities and Interface definitions (Abstract classes) for Repositories and UseCases.
- **Data Layer**: Implementation of Repositories. Handles API calls, Local DB (Stream/Future), and DTO mapping.
- **App/Presentation Layer**:
    - **State**: Immutable classes defined using `freezed`.
    - **ViewModel**: Uses `Notifier` or `AsyncNotifier`. Responsible for business logic and state updates.
    - **View**: `ConsumerWidget` or `ConsumerStatefulWidget`. Passive and reactive to state changes.

## 3. State Management (Riverpod Best Practices)
- **1-Screen 1-ViewModel 1-State**: Each screen manages its UI state in a single unified State object.
- **Dependency Injection**: Dependencies (UseCases/Services) are injected via `ref.watch` inside the ViewModel's `build()` method and stored as `late final` fields.
- **Computed State (Transformation)**:
    - Use `select` in the View for fine-grained rebuilds.
    - Use "Transformation Providers" (Derived Providers) to convert Entities into ViewData/UI models to keep ViewModels lean.
- **Reactivity**: Emphasize "Push-based" updates using `state = state.copyWith(...)`.

## 4. Navigation (Navigator 2.0 / GoRouter)
- **Stateful Navigation**: Implemented via `StatefulShellRoute` to maintain independent navigation stacks for each bottom tab (similar to multiple UINavigationControllers in iOS).
- **Navigation Service**: Navigation is abstracted into a `NavigationService` interface in the Domain layer, allowing ViewModels to trigger transitions without `BuildContext`.
- **Pop to Root**: Triggered by detecting a re-tap on the current tab index and calling `navigationShell.goBranch(index, initialLocation: true)`.

## 5. Testing & Quality
- **Testability**: Every provider is overridable in `ProviderContainer(overrides: [...])` for unit/widget testing with Mocks.
- **Coverage**: 
    - Target: Domain (100%), ViewModel (80%+).
    - Tooling: `flutter test --coverage` + `lcov` for HTML visualization.
- **LifeCycle Hooks**: Use `RouteObserver` with `RouteAware` (specifically `didPopNext`) to track Screen Views (PV) when returning from a pushed screen.

## 6. Coding Standards
- **Immutability**: Always use `freezed` for States.
- **Async Handling**: Use `AsyncValue` for asynchronous data to handle Loading/Error/Data states declaratively.
- **No BuildContext in Logic**: ViewModels must never depend on `BuildContext`. Use `ref` for all dependency lookups.
