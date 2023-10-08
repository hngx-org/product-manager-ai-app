String formatName(String input) {
  List<String> nameParts = input.split('0000');
  String formattedName = nameParts.map((part) {
    if (part.isNotEmpty) {
      return part[0].toUpperCase() + part.substring(1);
    }
    return part;
  }).join(' ');
  return formattedName;
}
