import 'package:pokedex_app/core/error/exceptions.dart';
import 'package:pokedex_app/core/error/failure.dart';
import 'package:pokedex_app/core/types/result.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_local_datasource.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_datasource.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:injectable/injectable.dart';

/// Implementation of [I{{name.pascalCase()}}Repository].
///
/// Coordinates between remote and local data sources.
/// Handles caching strategy and error mapping.
///
// TODO(developer): Implement all repository methods.
/// Pattern for each method:
/// 1. Try remote data source
/// 2. Cache result locally if appropriate
/// 3. Map exceptions to Failure types
/// 4. Return Result.success or Result.failure
@LazySingleton(as: I{{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl
    implements I{{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  final {{name.pascalCase()}}RemoteDataSource _remoteDataSource;
  // ignore: unused_field - Reserved for caching implementation
  final {{name.pascalCase()}}LocalDataSource _localDataSource;

  @override
  Future<Result<{{name.pascalCase()}}>> get{{name.pascalCase()}}ById(
    String id,
  ) async {
    try {
      // Try to fetch from remote
      final model = await _remoteDataSource.get{{name.pascalCase()}}ById(id);

      // TODO(developer): Cache the result if needed
      // await _localDataSource.cache{{name.pascalCase()}}(model);

      return Result.success(model.toEntity());
    } on ServerException catch (e) {
      // TODO(developer): Consider falling back to cache on network errors
      // final cached = await _localDataSource.getCached{{name.pascalCase()}}();
      // if (cached != null) return Result.success(cached.toEntity());

      return Result.failure(
        ServerFailure(e.message, statusCode: e.statusCode),
      );
    } on CacheException catch (e) {
      return Result.failure(CacheFailure(e.message));
    } on Exception catch (e) {
      return Result.failure(UnexpectedFailure(e.toString()));
    }
  }
}
