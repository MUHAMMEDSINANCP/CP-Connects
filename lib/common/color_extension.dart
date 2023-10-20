import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xff2676E1);
  static Color get primaryEnd => const Color(0xff00B5AA);

  static Color get secondary => const Color(0xffA3FEC7);
  static Color get secondaryEnd => const Color(0xff6AC6FC);

  static Color get primaryText => const Color(0xff434B56);
  static Color get primaryTextW => const Color(0xffFFFFFF);
  static Color get secondaryText => const Color(0xff7C8085);
  static Color get time => const Color(0xff787C81);
  static Color get base => const Color(0xff00B5AA);
  

  static List<Color> get primaryG => [ primary, primaryEnd ];
  static List<Color> get secondaryG => [ secondary, secondaryEnd ];
  
  static Color get bg => Colors.white;
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
