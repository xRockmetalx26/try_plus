import 'package:cout/cout.dart' show Cout;
import 'package:either_plus/either_plus.dart' show Either, Error, Value;
import 'package:try_plus/src/errors.dart' show TryError;

final class Try {
  const Try._();

  static Either<TryError, T> run<T>(
    T Function() call, {
    bool showExceptions = true,
  }) {
    try {
      final value = call();
      return Value(value);
    } catch (exception, trace) {
      if (showExceptions) Cout.error('$exception\n$trace');

      final error = TryError(exception.toString(), exception: exception);
      return Error(error);
    }
  }

  static Future<Either<TryError, T>> runAsync<T>(
    Future<T> Function() call, {
    bool showExceptions = true,
  }) async {
    try {
      final value = await call();
      return Value(value);
    } catch (exception, trace) {
      if (showExceptions) Cout.error('$exception\n$trace');

      final error = TryError(exception.toString(), exception: exception);
      return Error(error);
    }
  }
}
