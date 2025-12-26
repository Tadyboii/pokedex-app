import 'package:pokedex_app/core/error/exceptions.dart';
import 'package:pokedex_app/core/error/failure.dart';
import 'package:pokedex_app/core/types/result.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_local_datasource.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/data/datasources/{{name.snakeCase()}}_remote_datasource.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{name.pascalCase()}}RemoteDataSource extends Mock
    implements {{name.pascalCase()}}RemoteDataSource {}

class Mock{{name.pascalCase()}}LocalDataSource extends Mock
    implements {{name.pascalCase()}}LocalDataSource {}

void main() {
  late {{name.pascalCase()}}RepositoryImpl repository;
  late Mock{{name.pascalCase()}}RemoteDataSource mockRemoteDataSource;
  late Mock{{name.pascalCase()}}LocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = Mock{{name.pascalCase()}}RemoteDataSource();
    mockLocalDataSource = Mock{{name.pascalCase()}}LocalDataSource();
    repository = {{name.pascalCase()}}RepositoryImpl(
      mockRemoteDataSource,
      mockLocalDataSource,
    );
  });

  group('get{{name.pascalCase()}}ById', () {
    const testId = 'test-id';

    // TODO(developer): Replace with actual test model properties
    const testModel = {{name.pascalCase()}}Model(
      id: testId,
      // Add other required properties
    );

    test(
      'should return {{name.pascalCase()}} when remote call is successful',
      () async {
        // Arrange
        when(() => mockRemoteDataSource.get{{name.pascalCase()}}ById(testId))
            .thenAnswer((_) async => testModel);

        // Act
        final result = await repository.get{{name.pascalCase()}}ById(testId);

        // Assert
        expect(result.isSuccess, true);
        expect(result.dataOrNull, testModel.toEntity());
        verify(() => mockRemoteDataSource.get{{name.pascalCase()}}ById(testId))
            .called(1);
      },
    );

    test(
      'should return ServerFailure when remote call throws ServerException',
      () async {
        // Arrange
        when(() => mockRemoteDataSource.get{{name.pascalCase()}}ById(testId))
            .thenThrow(
          const ServerException(message: 'Server error', statusCode: 500),
        );

        // Act
        final result = await repository.get{{name.pascalCase()}}ById(testId);

        // Assert
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Should not be success'),
          failure: (f) {
            expect(f, isA<ServerFailure>());
            expect(f.message, 'Server error');
          },
        );
      },
    );

    test(
      'should return CacheFailure when cache operation fails',
      () async {
        // Arrange
        when(() => mockRemoteDataSource.get{{name.pascalCase()}}ById(testId))
            .thenThrow(const CacheException('Cache error'));

        // Act
        final result = await repository.get{{name.pascalCase()}}ById(testId);

        // Assert
        expect(result.isFailure, true);
        result.when(
          success: (_) => fail('Should not be success'),
          failure: (f) {
            expect(f, isA<CacheFailure>());
            expect(f.message, 'Cache error');
          },
        );
      },
    );

    // TODO(developer): Add tests for:
    // - Caching logic (when implemented)
    // - Cache fallback when network fails
    // - Other error scenarios
  });
}
