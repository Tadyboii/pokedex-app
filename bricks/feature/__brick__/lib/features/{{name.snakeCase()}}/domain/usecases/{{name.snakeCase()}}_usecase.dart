import 'package:pokedex_app/core/types/result.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case for {{name.pascalCase()}} operations.
///
/// This class contains the business logic for the feature.
/// It uses the callable pattern - invoke with `useCase(params)`.
///
/// For use cases with 3+ parameters, consider creating a Params class:
/// ```dart
/// class {{name.pascalCase()}}Params {
///   {{name.pascalCase()}}Params({
///     required this.id,
///     required this.name,
///     required this.description,
///   });
///
///   final String id;
///   final String name;
///   final String description;
/// }
/// ```
@lazySingleton
class {{name.pascalCase()}}UseCase {
  {{name.pascalCase()}}UseCase(this._repository);

  final I{{name.pascalCase()}}Repository _repository;

  /// Executes the use case.
  ///
  // TODO(developer): Implement your business logic here.
  /// Consider:
  /// - Input validation
  /// - Business rules enforcement
  /// - Error handling with Result&lt;Success&gt;
  ///
  /// Example validation:
  /// ```dart
  /// if (id.isEmpty) {
  ///   return const Result.failure(
  ///     ValidationFailure('ID cannot be empty'),
  ///   );
  /// }
  /// ```
  Future<Result<{{name.pascalCase()}}>> call({
    required String id,
  }) async {
    return _repository.get{{name.pascalCase()}}ById(id);
  }
}
