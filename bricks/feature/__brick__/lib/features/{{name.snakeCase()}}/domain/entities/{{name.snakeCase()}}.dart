import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.snakeCase()}}.freezed.dart';

/// {{name.pascalCase()}} entity representing the core business object.
///
/// This is a pure Dart class with no Flutter or external dependencies.
///
// TODO(developer): Define your entity properties.
/// Example properties:
/// - required String id
/// - required String name
/// - String? description
/// - @Default(false) bool isActive
@freezed
class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const factory {{name.pascalCase()}}({
    required String id,
  }) = _{{name.pascalCase()}};
}
