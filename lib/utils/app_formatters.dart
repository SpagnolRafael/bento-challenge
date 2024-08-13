class AppFormatters {
  static String money(String? text) {
    if (text == null || text.isEmpty) return '0.00';
    final array = text.split('.');
    if (array.length == 1) return '${array[0]}.00';
    return '${array[0]}.${array[1].substring(0, 2)}';
  }
}
