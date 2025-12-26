import 'package:pokedex_app/features/{{name.snakeCase()}}/data/models/{{name.snakeCase()}}_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Local data source for {{name.pascalCase()}} feature.
///
/// ## SECURITY CONSIDERATIONS (Banking App)
///
/// - All sensitive data MUST use [FlutterSecureStorage]
/// - **Never cache:** passwords, PINs, OTPs, CVVs, full card numbers
/// - **Consider caching:** user preferences, non-sensitive metadata
/// - Implement cache expiration for any cached credentials
/// - Clear cache on logout via [clearCache]
///
/// ## Cache Strategy Questions
///
/// Before implementing caching, consider:
/// 1. What data is safe to cache locally?
/// 2. What is the cache TTL (time-to-live)?
/// 3. When should cache be invalidated?
/// 4. Does this data need encryption at rest? (Use FlutterSecureStorage)
@lazySingleton
class {{name.pascalCase()}}LocalDataSource {
  {{name.pascalCase()}}LocalDataSource(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  // Cache key constants
  static const String _cacheKey = '{{name.snakeCase()}}_cache';
  static const String _cacheTimestampKey =
      '{{name.snakeCase()}}_cache_timestamp';

  /// Retrieves cached {{name.pascalCase()}} if available and not expired.
  ///
  /// Returns `null` if cache is empty or expired.
  ///
  // TODO(developer): Implement cache retrieval if needed.
  /// Example implementation:
  /// ```dart
  /// import 'dart:convert';
  ///
  /// // Define cache TTL (time-to-live)
  /// static const Duration _cacheTtl = Duration(minutes: 5);
  ///
  /// final timestamp = await _secureStorage.read(key: _cacheTimestampKey);
  /// if (timestamp == null) return null;
  ///
  /// final cachedTime = DateTime.parse(timestamp);
  /// if (DateTime.now().difference(cachedTime) > _cacheTtl) {
  ///   await clearCache();
  ///   return null;
  /// }
  ///
  /// final json = await _secureStorage.read(key: _cacheKey);
  /// if (json == null) return null;
  /// return {{name.pascalCase()}}Model.fromJson(
  ///   jsonDecode(json) as Map<String, dynamic>,
  /// );
  /// ```
  Future<{{name.pascalCase()}}Model?> getCached{{name.pascalCase()}}() async {
    return null;
  }

  /// Caches a {{name.pascalCase()}} model securely.
  ///
  /// **Security Note:** Only cache non-sensitive data.
  ///
  // TODO(developer): Implement caching if needed.
  /// Example implementation:
  /// ```dart
  /// import 'dart:convert';
  ///
  /// await _secureStorage.write(
  ///   key: _cacheKey,
  ///   value: jsonEncode(model.toJson()),
  /// );
  /// await _secureStorage.write(
  ///   key: _cacheTimestampKey,
  ///   value: DateTime.now().toIso8601String(),
  /// );
  /// ```
  Future<void> cache{{name.pascalCase()}}(
    {{name.pascalCase()}}Model model,
  ) async {
    // Implementation goes here
  }

  /// Clears all cached data for this feature.
  ///
  /// **Important:** Call this method during logout flows.
  Future<void> clearCache() async {
    await _secureStorage.delete(key: _cacheKey);
    await _secureStorage.delete(key: _cacheTimestampKey);
  }
}
