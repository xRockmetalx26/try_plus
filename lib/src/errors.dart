import 'package:either_plus/either_plus.dart' show EitherError;

final class TryError extends EitherError {
  const TryError(
    String message, {
    super.exception,
  }) : super(message: message);
}
