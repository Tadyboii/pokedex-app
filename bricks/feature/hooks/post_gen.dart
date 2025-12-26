import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final runBuildRunner = context.logger.confirm(
    'Run build_runner to generate Freezed/JSON files?',
    defaultValue: true,
  );

  if (!runBuildRunner) {
    context.logger.info(
      'Skipping build_runner. Run manually with:\n'
      '  fvm dart run build_runner build --delete-conflicting-outputs',
    );
    return;
  }

  final progress = context.logger.progress('Running build_runner');

  try {
    final result = await Process.run(
      'fvm',
      ['dart', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      runInShell: true,
    );

    if (result.exitCode == 0) {
      progress.complete('Code generation complete');
    } else {
      progress.fail('Code generation failed');
      context.logger.err(result.stderr.toString());
    }
  } on Exception catch (e) {
    progress.fail('Failed to run build_runner');
    context.logger.err(e.toString());
    context.logger.info(
      'Run manually with:\n'
      '  fvm dart run build_runner build --delete-conflicting-outputs',
    );
  }
}
