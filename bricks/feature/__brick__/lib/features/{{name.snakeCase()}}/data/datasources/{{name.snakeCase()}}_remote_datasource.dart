import 'package:pokedex_app/core/error/exceptions.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Remote data source for {{name.pascalCase()}} feature.
///
/// Handles all API communication for this feature.
/// Uses Dio for HTTP requests with automatic Talker logging.
///
// TODO(developer): Implement your API methods.
/// Example methods:
/// ```dart
/// Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}ById(String id);
/// Future<List<{{name.pascalCase()}}Model>> getAll{{name.pascalCase()}}s();
/// Future<{{name.pascalCase()}}Model> create{{name.pascalCase()}}(
///   {{name.pascalCase()}}Model model,
/// );
/// Future<{{name.pascalCase()}}Model> update{{name.pascalCase()}}(
///   {{name.pascalCase()}}Model model,
/// );
/// Future<void> delete{{name.pascalCase()}}(String id);
/// ```
@lazySingleton
class {{name.pascalCase()}}RemoteDataSource {
  {{name.pascalCase()}}RemoteDataSource(this._dio);

  final Dio _dio;

  /// Fetches a {{name.pascalCase()}} by ID from the API.
  ///
  /// Throws [ServerException] on failure.
  Future<{{name.pascalCase()}}Model> get{{name.pascalCase()}}ById(
    String id,
  ) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/api/v1/{{name.snakeCase()}}/$id',
      );

      return {{name.pascalCase()}}Model.fromJson(response.data!);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      final errorMessage = responseData is Map<String, dynamic>
          ? (responseData['message'] as String?) ?? 'Unknown error'
          : 'Unknown error';

      throw ServerException(
        message: errorMessage,
        statusCode: e.response?.statusCode,
      );
    }
  }
}
