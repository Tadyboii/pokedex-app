import 'package:pokedex_app/core/types/result.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/domain/usecases/{{name.snakeCase()}}_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '{{name.snakeCase()}}_bloc.freezed.dart';
part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

/// BLoC for {{name.pascalCase()}} feature.
///
/// Orchestrates UI events and delegates business logic to use cases.
/// Never contains business logic directly - that belongs in use cases.
///
// TODO(developer): Register event handlers.
@injectable
class {{name.pascalCase()}}Bloc
    extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc(this._{{name.camelCase()}}UseCase)
      : super({{name.pascalCase()}}State.initial()) {
    on<_Fetch{{name.pascalCase()}}>(_onFetch{{name.pascalCase()}});
  }

  final {{name.pascalCase()}}UseCase _{{name.camelCase()}}UseCase;

  /// Handles fetch {{name.camelCase()}} event.
  Future<void> _onFetch{{name.pascalCase()}}(
    _Fetch{{name.pascalCase()}} event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    // Set loading state while preserving existing data
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _{{name.camelCase()}}UseCase(id: event.id);

    result.when(
      success: ({{name.camelCase()}}) => emit(
        state.copyWith(
          isLoading: false,
          {{name.camelCase()}}: {{name.camelCase()}},
        ),
      ),
      failure: (failure) => emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ),
      ),
    );
  }
}
