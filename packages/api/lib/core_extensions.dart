import 'package:colorize/colorize.dart';

printPretty(Map map, {Styles textColor = Styles.GREEN, int level = 1}) {
  color("{", front: textColor);

  map.forEach((key, value) {
    if (value is Map) {
      color("  {", front: textColor);
      (value).forEach((key, value) {
        if (value is List && level > 1) {
          _printInnerList(key, textColor, value);
        } else if (value is Map && level > 1) {
          _printInnerData('$key:', '    ', textColor, value);
        } else {
          color("    $key: $value,", front: textColor);
        }
      });
      color("  }", front: textColor);
    } else {
      color("  $key: $value", front: textColor);
    }
  });
  color("}", front: textColor);
}

void _printInnerList(key, Styles textColor, List value) {
  color("    $key: [", front: textColor);
  value.forEach((element) {
    if (element is Map) {
      _printInnerData('', '     ', textColor, element);
    } else {
      color("     $element", front: textColor);
    }
  });
  color("   ]", front: textColor);
}

_printInnerData(String key, String indention, Styles textColor, Map value) {
  color("$indention$key {", front: textColor);
  value.forEach((key, value) {
    color("$indention $key: $value,", front: textColor);
  });
  color("$indention},", front: textColor);
}
