import 'package:flutter_demo/core/utility/validation/validation_result.dart';

class Validation<T> {
  final T? value;

  Validation({required this.value});

  ValidationResult<T, E> apply<E>(bool Function(T?) validate, E error) {
    if (validate(value)) {
      return ValidationResult.valid(value as T);
    } else {
      return ValidationResult.invalid(error);
    }
  }

  ValidationResult<T, E> optional<E>(bool Function(T?) validate, E error) {
    if (_isNull) {
      return ValidationResult.nullValid();
    } else {
      return apply(validate, error);
    }
  }

  bool get _isNull {
    if (value == null) {
      return true;
    } else if ((value as String).isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

extension ValidationResultExt<T, E> on ValidationResult<T, E> {

  ValidationResult<T, E> apply(bool Function(T?) validate, E error) {
    if (isValid) {
      return Validation(value: value).apply(validate, error);
    } else {
      return ValidationResult.invalid(this.error as E);
    }
  }

  ValidationResult<T, E> optional(bool Function(T?) validate, E error) {
    if (isValid) {
      return Validation(value: value).optional(validate, error);
    } else {
      return ValidationResult.invalid(this.error as E);
    }
  }
}
