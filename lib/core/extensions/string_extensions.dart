extension StringExt on String {
  double toDoubleOr({double value = 0}) {
    return double.parse(this);
  }
}