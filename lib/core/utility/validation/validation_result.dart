class ValidationResult<T, E> {
  final bool isValid;
  final T? value;
  final E? error;

  ValidationResult._(this.isValid, this.value, this.error);

  static ValidationResult<T, E> valid<T, E>(T value) {
    return ValidationResult._(true, value, null);
  }

  static ValidationResult<T, E> nullValid<T, E>() {
    return ValidationResult._(true, null, null);
  }

  static ValidationResult<T, E> invalid<T, E>(E error) {
    return ValidationResult._(false, null, error);
  }

  /*
  ValidationResult<V, E> map<V>(V Function(T) f) {
    if (isValid) {
      return ValidationResult.valid(f(value as T));
    } else {
      return ValidationResult.invalid(error as E);
    }
  }

  ValidationResult<T, F> mapError<F>(F f) {
    if (isValid) {
      return ValidationResult.valid(value as T);
    } else {
      return ValidationResult.invalid(f);
    }
  }
   */
}

extension ValidationResultCheck on List<ValidationResult> {
  ValidationResult<T, List<E>> validate<T, E>(T value) {
    if (where((e) => e.isValid).length == length) {
      return ValidationResult.valid(value);
    } else {
      final error = where((e) => e.error != null)
        .map((e) => e.error as E)
        .toList();
      return ValidationResult.invalid(error);
    }
  }
}
