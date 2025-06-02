import 'package:either_plus/either_plus.dart' show EitherError;

final class TryError extends EitherError {
  const TryError(
    super.message, {
    super.details,
    super.code,
    super.exception,
  });
}
