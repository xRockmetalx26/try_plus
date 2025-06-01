import 'package:either_plus/either_plus.dart'
    show EValue, Error, FEValue, Value;
import 'package:cout/cout.dart' show Cout;
import 'package:try_plus/src/errors.dart' show TryError;

final class Try {
  const Try._();

  static EValue<T?> run<T>(T? Function() call, {bool showExceptions = true}) {
    try {
      final value = call();
      return Value(value);
    } catch (exception, trace) {
      if (showExceptions) Cout.error('$exception\n$trace');

      final error = TryError(exception.toString(), exception);
      return Error(error);
    }
  }

  static FEValue<T?> runAsync<T>(
    Future<T?> Function() call, {
    bool showExceptions = true,
  }) async {
    try {
      final value = await call();
      return Value(value);
    } catch (exception, trace) {
      if (showExceptions) Cout.error('$exception\n$trace');

      final error = TryError(exception.toString(), exception);
      return Error(error);
    }
  }
}
