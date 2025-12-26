import 'package:pokedex_app/core/types/result.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

/// Repository interface for {{name.pascalCase()}} feature.
///
/// This defines the contract that the data layer must implement.
/// All methods return [Result] for type-safe error handling.
///
// TODO(developer): Define your repository contract methods.
/// Example methods:
/// ```dart
/// Future<Result<{{name.pascalCase()}}>> get{{name.pascalCase()}}ById(String id);
/// Future<Result<List<{{name.pascalCase()}}>>> getAll{{name.pascalCase()}}s();
/// Future<Result<{{name.pascalCase()}}>> create{{name.pascalCase()}}(
///   {{name.pascalCase()}} entity,
/// );
/// Future<Result<{{name.pascalCase()}}>> update{{name.pascalCase()}}(
///   {{name.pascalCase()}} entity,
/// );
/// Future<Result<void>> delete{{name.pascalCase()}}(String id);
/// ```
abstract class I{{name.pascalCase()}}Repository {
  /// Fetches a {{name.pascalCase()}} by its unique identifier.
  Future<Result<{{name.pascalCase()}}>> get{{name.pascalCase()}}ById(String id);
}
