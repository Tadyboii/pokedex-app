import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:json_annotation/json_annotation.dart';

part '{{name.snakeCase()}}_model.g.dart';

/// Data Transfer Object for {{name.pascalCase()}}.
///
/// This class handles JSON serialization and maps to/from the domain entity.
/// Use `@JsonKey` for custom field mapping when API field names differ.
///
// TODO(developer): Define your DTO fields matching the API response.
/// Example:
/// ```dart
/// @JsonKey(name: 'user_id')
/// final String id;
///
/// @JsonKey(name: 'full_name')
/// final String name;
///
/// @JsonKey(name: 'is_active', defaultValue: false)
/// final bool isActive;
/// ```
@JsonSerializable()
class {{name.pascalCase()}}Model {
  const {{name.pascalCase()}}Model({
    required this.id,
  });

  /// Creates a model from JSON.
  factory {{name.pascalCase()}}Model.fromJson(
    Map<String, dynamic> json,
  ) =>
      _${{name.pascalCase()}}ModelFromJson(json);

  /// Creates a model from a domain entity.
  ///
  /// Useful for:
  /// - Caching domain objects locally
  /// - Sending updates to the API
  factory {{name.pascalCase()}}Model.fromEntity(
    {{name.pascalCase()}} entity,
  ) =>
      {{name.pascalCase()}}Model(
        id: entity.id,
        // TODO(developer): Map all fields from entity
      );

  final String id;

  /// Converts the model to JSON.
  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ModelToJson(this);

  /// Converts this DTO to a domain entity.
  {{name.pascalCase()}} toEntity() => {{name.pascalCase()}}(
        id: id,
        // TODO(developer): Map all fields to entity
      );
}
