import 'package:injectable/injectable.dart';

/// Dependency injection module for {{name.pascalCase()}} feature.
///
/// This module is automatically registered by Injectable.
/// Use it for:
/// - Interface to implementation bindings
/// - Factory methods that need complex construction
///
/// Note: Most dependencies self-register using @lazySingleton or @injectable
/// on the class itself. This module is primarily for interface bindings.
@module
abstract class {{name.pascalCase()}}Module {
  // The repository binding is handled by
  // @LazySingleton(as: I{{name.pascalCase()}}Repository)
  // on the {{name.pascalCase()}}RepositoryImpl class.
  //
  // Add any additional factory methods here if needed.
  // Example:
  //
  // @lazySingleton
  // SomeClient someClient(Dio dio) => SomeClient(dio);
}
