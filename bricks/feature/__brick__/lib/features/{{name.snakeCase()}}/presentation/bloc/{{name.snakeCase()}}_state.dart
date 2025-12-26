part of '{{name.snakeCase()}}_bloc.dart';

/// State for {{name.pascalCase()}} BLoC.
///
/// Uses DATA-BASED state pattern (NOT action-based).
/// This preserves all UI data even during loading or error scenarios.
///
/// See: docs/architecture/overview.md
///
// TODO(developer): Define state properties with ALL data needed to render UI.
/// Example properties:
/// ```dart
/// User? currentUser,
/// List<Item> items,
/// int selectedIndex,
/// ```
@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    /// The currently loaded {{name.pascalCase()}}.
    {{name.pascalCase()}}? {{name.camelCase()}},

    /// Whether a loading operation is in progress.
    @Default(false) bool isLoading,

    /// Error message if the last operation failed.
    String? errorMessage,
  }) = _{{name.pascalCase()}}State;

  /// Creates the initial state.
  factory {{name.pascalCase()}}State.initial() =>
      const {{name.pascalCase()}}State();
}
