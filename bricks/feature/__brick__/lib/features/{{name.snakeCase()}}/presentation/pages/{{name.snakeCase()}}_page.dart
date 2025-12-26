import 'package:pokedex_app/core/di/injection.dart';
import 'package:pokedex_app/features/{{name.snakeCase()}}/presentation/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Page for {{name.pascalCase()}} feature.
///
/// This widget provides the BLoC to the widget tree.
/// The actual UI is in [{{name.pascalCase()}}View].
class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<{{name.pascalCase()}}Bloc>(),
      child: const {{name.pascalCase()}}View(),
    );
  }
}

/// View for {{name.pascalCase()}} feature.
///
/// Contains the actual UI implementation.
/// Separated from [{{name.pascalCase()}}Page] for testability.
class {{name.pascalCase()}}View extends StatelessWidget {
  const {{name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO(developer): Use l10n for localization
        title: const Text('{{name.pascalCase()}}'),
      ),
      body: BlocBuilder<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO(developer): Implement retry logic
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // TODO(developer): Build your UI here
          return const Center(
            child: Text('{{name.pascalCase()}} Feature'),
          );
        },
      ),
    );
  }
}
