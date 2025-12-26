# {{name.pascalCase()}} Feature

## Structure

```
lib/features/{{name.snakeCase()}}/
├── di/
│   └── {{name.snakeCase()}}_module.dart        # DI module (interface bindings)
├── data/
│   ├── datasources/
│   │   ├── {{name.snakeCase()}}_remote_datasource.dart
│   │   └── {{name.snakeCase()}}_local_datasource.dart
│   ├── models/
│   │   └── {{name.snakeCase()}}_model.dart     # DTO with JSON serialization
│   └── repositories/
│       └── {{name.snakeCase()}}_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── {{name.snakeCase()}}.dart           # Pure Dart entity
│   ├── repositories/
│   │   └── i_{{name.snakeCase()}}_repository.dart
│   └── usecases/
│       └── {{name.snakeCase()}}_usecase.dart
└── presentation/
    ├── bloc/
    │   ├── {{name.snakeCase()}}_bloc.dart
    │   ├── {{name.snakeCase()}}_event.dart
    │   └── {{name.snakeCase()}}_state.dart
    ├── pages/
    │   └── {{name.snakeCase()}}_page.dart
    └── widgets/
```

## Implementation Order

Follow the numbered TODO comments in the generated files:

| Step | File | Action |
|------|------|--------|
| 1 | `domain/entities/{{name.snakeCase()}}.dart` | Define entity properties |
| 2 | `domain/repositories/i_{{name.snakeCase()}}_repository.dart` | Define repository contract |
| 3 | `domain/usecases/{{name.snakeCase()}}_usecase.dart` | Implement business logic |
| 4 | `data/models/{{name.snakeCase()}}_model.dart` | Define DTO and mapping |
| 5 | `data/repositories/{{name.snakeCase()}}_repository_impl.dart` | Implement repository |
| 6 | `presentation/bloc/{{name.snakeCase()}}_state.dart` | Define state properties |
| 7 | `presentation/bloc/{{name.snakeCase()}}_event.dart` | Define events |
| 8 | `presentation/bloc/{{name.snakeCase()}}_bloc.dart` | Implement event handlers |
| 9 | `presentation/pages/{{name.snakeCase()}}_page.dart` | Build UI |
| 10 | `presentation/widgets/` | Extract reusable widgets |

## Running Tests

```bash
fvm flutter test test/features/{{name.snakeCase()}}/
```

## Code Generation

After modifying Freezed or JsonSerializable classes:

```bash
fvm dart run build_runner build --delete-conflicting-outputs
```

## API Endpoints

> Update this section with actual endpoints when implementing.

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/v1/{{name.snakeCase()}}/:id` | Get {{name.camelCase()}} by ID |
| POST | `/api/v1/{{name.snakeCase()}}` | Create {{name.camelCase()}} |
| PUT | `/api/v1/{{name.snakeCase()}}/:id` | Update {{name.camelCase()}} |
| DELETE | `/api/v1/{{name.snakeCase()}}/:id` | Delete {{name.camelCase()}} |

## Security Considerations

This is a banking application. Before implementing:

- [ ] Review what data is safe to cache locally
- [ ] Ensure sensitive data uses `FlutterSecureStorage`
- [ ] Never log: passwords, PINs, tokens, OTPs, CVVs, card numbers
- [ ] Implement cache expiration for credentials
- [ ] Clear cache on logout

## Checklist Before PR

- [ ] All TODO comments addressed
- [ ] Tests written and passing
- [ ] No cross-feature imports
- [ ] Domain layer is pure Dart (no Flutter imports)
- [ ] User-facing strings use l10n
- [ ] No `print()` statements (use Talker)
- [ ] Code formatted: `fvm dart format .`
- [ ] Analysis passing: `fvm flutter analyze`
