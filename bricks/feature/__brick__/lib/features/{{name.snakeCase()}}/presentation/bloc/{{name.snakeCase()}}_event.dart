part of '{{name.snakeCase()}}_bloc.dart';

/// Events for {{name.pascalCase()}} BLoC.
///
// TODO(developer): Define your events.
/// Example events:
/// ```dart
/// const factory {{name.pascalCase()}}Event.started() = _Started;
/// const factory {{name.pascalCase()}}Event.refreshed() = _Refreshed;
/// const factory {{name.pascalCase()}}Event.itemSelected(String id) =
///     _ItemSelected;
/// ```
@freezed
sealed class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  /// Event to fetch {{name.pascalCase()}} by ID.
  const factory {{name.pascalCase()}}Event.fetch{{name.pascalCase()}}({
    required String id,
  }) = _Fetch{{name.pascalCase()}};
}
