class ErrorHandler {
  String getValidationMessage(Map<String, dynamic> json) {
    if (json.keys.contains('detail')) return json.values.first;
    return '';
  }
}
