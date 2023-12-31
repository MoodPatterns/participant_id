extension StringExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');

  String removeAllWhitespace() => replaceAll(RegExp(r"\s+"), "");

  String replaceSpecialChars() => replaceAll(RegExp(r'[^\p{L}]', unicode: true), '_');
}