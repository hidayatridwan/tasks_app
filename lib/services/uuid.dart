class UUIDGen {
  static String generate() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
