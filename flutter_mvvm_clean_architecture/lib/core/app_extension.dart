extension NonNullString on String? {
  String orEmpty() {
    return this ?? "";
  }

  bool isNotNull() {
    return this != null && this != "";
  }
}

extension NonNullInt on int? {
  int orNull() {
    return this ?? -1;
  }
}
