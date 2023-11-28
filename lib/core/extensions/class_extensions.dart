extension GetClassNameExtension on dynamic {
  String get className => runtimeType.toString();
}