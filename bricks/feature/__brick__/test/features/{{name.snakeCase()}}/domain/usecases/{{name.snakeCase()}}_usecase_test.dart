import 'package:pokedex_app/core/error/failure.dart';
import 'package:pokedex_app/core/types/result.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/repositories/i_{{name.snakeCase()}}_repository.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockI{{name.pascalCase()}}Repository extends Mock
    implements I{{name.pascalCase()}}Repository {}

void main() {
  late {{name.pascalCase()}}UseCase useCase;
  late MockI{{name.pascalCase()}}Repository mockRepository;

  setUp(() {
    mockRepository = MockI{{name.pascalCase()}}Repository();
    useCase = {{name.pascalCase()}}UseCase(mockRepository);
  });

  group('{{name.pascalCase()}}UseCase', () {
    const testId = 'test-id';

    // TODO(developer): Replace with actual test entity properties
    const test{{name.pascalCase()}} = {{name.pascalCase()}}(
      id: testId,
      // Add other required properties
    );

    test(
      'should get {{name.camelCase()}} from repository when call succeeds',
      () async {
        // Arrange
        when(() => mockRepository.get{{name.pascalCase()}}ById(testId))
            .thenAnswer((_) async => const Result.success(test{{name.pascalCase()}}));

        // Act
        final result = await useCase(id: testId);

        // Assert
        expect(result.isSuccess, true);
        expect(result.dataOrNull, test{{name.pascalCase()}});
        verify(() => mockRepository.get{{name.pascalCase()}}ById(testId))
            .called(1);
        verifyNoMoreInteractions(mockRepository);
      },
    );

    test('should return failure when repository fails', () async {
      // Arrange
      const failure = Failure.server('Server error');
      when(() => mockRepository.get{{name.pascalCase()}}ById(testId))
          .thenAnswer((_) async => const Result.failure(failure));

      // Act
      final result = await useCase(id: testId);

      // Assert
      expect(result.isFailure, true);
      result.when(
        success: (_) => fail('Should not be success'),
        failure: (f) => expect(f, failure),
      );
      verify(() => mockRepository.get{{name.pascalCase()}}ById(testId))
          .called(1);
    });

    // TODO(developer): Add tests for business logic within the use case.
    // For example:
    // - Validation logic
    // - Data transformation
    // - Multiple repository calls
  });
}
