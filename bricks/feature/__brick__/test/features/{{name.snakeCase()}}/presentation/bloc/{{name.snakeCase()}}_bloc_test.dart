import 'package:pokedex_app/core/error/failure.dart';
import 'package:pokedex_app/core/types/result.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}_usecase.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/presentation/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{name.pascalCase()}}UseCase extends Mock
    implements {{name.pascalCase()}}UseCase {}

void main() {
  late {{name.pascalCase()}}Bloc bloc;
  late Mock{{name.pascalCase()}}UseCase mockUseCase;

  setUp(() {
    mockUseCase = Mock{{name.pascalCase()}}UseCase();
    bloc = {{name.pascalCase()}}Bloc(mockUseCase);
  });

  tearDown(() async {
    await bloc.close();
  });

  test('initial state is correct', () {
    expect(bloc.state, equals({{name.pascalCase()}}State.initial()));
  });

  group('Fetch{{name.pascalCase()}}', () {
    const testId = 'test-id';

    // TODO(developer): Replace with actual test entity properties
    const test{{name.pascalCase()}} = {{name.pascalCase()}}(
      id: testId,
      // Add other required properties
    );

    blocTest<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
      'emits [loading, loaded] when fetch is successful',
      build: () {
        when(() => mockUseCase(id: testId)).thenAnswer(
          (_) async => const Result.success(test{{name.pascalCase()}}),
        );
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const {{name.pascalCase()}}Event.fetch{{name.pascalCase()}}(id: testId)),
      expect: () => [
        {{name.pascalCase()}}State.initial().copyWith(isLoading: true),
        {{name.pascalCase()}}State.initial().copyWith(
          isLoading: false,
          {{name.camelCase()}}: test{{name.pascalCase()}},
        ),
      ],
      verify: (_) {
        verify(() => mockUseCase(id: testId)).called(1);
      },
    );

    blocTest<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
      'emits [loading, error] when fetch fails',
      build: () {
        when(() => mockUseCase(id: testId)).thenAnswer(
          (_) async => const Result.failure(
            Failure.server('Failed to fetch {{name.camelCase()}}'),
          ),
        );
        return bloc;
      },
      act: (bloc) =>
          bloc.add(const {{name.pascalCase()}}Event.fetch{{name.pascalCase()}}(id: testId)),
      expect: () => [
        {{name.pascalCase()}}State.initial().copyWith(isLoading: true),
        {{name.pascalCase()}}State.initial().copyWith(
          isLoading: false,
          errorMessage: 'Failed to fetch {{name.camelCase()}}',
        ),
      ],
    );

    // TODO(developer): Add more test cases for other events.
  });
}
