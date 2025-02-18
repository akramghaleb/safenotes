// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:safenotes/data/preference_and_config.dart';

class NotesColor extends ChangeNotifier {
  static Color getNoteColor({required int notIndex}) {
    var _lightColors =
        allNotesColorTheme[PreferencesStorage.getColorfulNotesColorIndex()]
            .colorList;
    return PreferencesStorage.getIsColorful()
        ? _lightColors[notIndex % _lightColors.length]
        : Color(0xFFA7BEAE);
  }

  void toggleColor() {
    PreferencesStorage.setIsColorful(!PreferencesStorage.getIsColorful());
    notifyListeners();
  }
}

// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     return int.parse(hexColor, radix: 16);
//   }
//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }

class NotesColorTheme {
  final String prefix;
  final String? helper;
  final List<Color> colorList;
  const NotesColorTheme(
      {required this.prefix, this.helper, required this.colorList});
}

const List<NotesColorTheme> allNotesColorTheme = [
  NotesColorTheme(
    prefix: 'Nord Arctic',
    helper: 'Default',
    colorList: <Color>[
      Color(0xFF5E81AC),
      Color(0xFFD08770),
      Color(0xFFA3BE8C),
      Color(0xFFB48EAD),
      Color(0xFF81A1C1),
    ],
  ),
  NotesColorTheme(
    prefix: 'Harmony',
    helper: 'Deep Blue, Northern Sky, Baby Blue and Coffee',
    colorList: <Color>[
      Color(0xFF2460A7),
      Color(0xFF85B3D1),
      Color(0xFFB3C7D6),
      Color(0xFFD9B48F),
    ],
  ),
  NotesColorTheme(
    prefix: 'Refreshing',
    helper: 'Soft Pink, Peach Amber, Yucca and Arbor Green',
    colorList: <Color>[
      Color(0xFFFFDDE2),
      Color(0xFFFAA094),
      Color(0xFF9ED9CC),
      Color(0xFF008C76),
    ],
  ),
  NotesColorTheme(
    prefix: 'Peace',
    helper: 'Blue Sky, Elation, Nugget and Celestial',
    colorList: <Color>[
      Color(0xFFABD1C9),
      Color(0xFFDFDCE5),
      Color(0xFFDBB04A),
      Color(0xFF97B3D0),
    ],
  ),
  NotesColorTheme(
    prefix: 'Nostalgic',
    helper: 'Desert Sand, Burnished Brown, Old Burgundy and Mystic',
    colorList: <Color>[
      Color(0xFFDBBEA1),
      Color(0xFFA37B73),
      Color(0xFF3E282B),
      Color(0xFFD34F73),
    ],
  ),
  NotesColorTheme(
    prefix: 'Sapphire',
    helper: 'Sapphire, Light Slate Gray, Cadet Gray and American Silver',
    colorList: <Color>[
      Color(0xFF2E5266),
      Color(0xFF6E8898),
      Color(0xFF9FB1BC),
      Color(0xFFD3D0CB),
    ],
  ),
  NotesColorTheme(
    prefix: 'Ensemble',
    helper: 'Light Purple, Light Blue and Light Green',
    colorList: <Color>[
      Color(0xFFD7A9E3),
      Color(0xFF8BBEE8),
      Color(0xFFA8D5BA),
    ],
  ),
  NotesColorTheme(
    prefix: 'Radiant',
    helper: 'Radiant Yellow, Living Coral and Purple',
    colorList: <Color>[
      Color(0xFFF9A12E),
      Color(0xFFFC766A),
      Color(0xFF9B4A97),
    ],
  ),
  NotesColorTheme(
    prefix: 'Innocent',
    helper: 'White, Pink Lady and Sky Blue',
    colorList: <Color>[
      Color(0xFFFCF6F5),
      Color(0xFFEDC2D8),
      Color(0xFF8ABAD3),
    ],
  ),
  NotesColorTheme(
    prefix: 'Oktoberfest',
    helper: 'Red, Yellow and Navy',
    colorList: <Color>[
      Color(0xFFF65058),
      Color(0xFFFBDE44),
      Color(0xFF28334A),
    ],
  ),
  NotesColorTheme(
    prefix: 'Nature',
    helper: 'Tanager Turquoise, Teal Blue and Kelly Green',
    colorList: <Color>[
      Color(0xFF95DBE5),
      Color(0xFF078282),
      Color(0xFF339E66),
    ],
  ),
  NotesColorTheme(
    prefix: 'Knockout',
    helper: 'Knockout Pink, Safety Yellow and Out of the Blue',
    colorList: <Color>[
      Color(0xFFFF3EA5),
      Color(0xFFEDFF00),
      Color(0xFF00A4CC),
    ],
  ),
  NotesColorTheme(
    prefix: 'Danger',
    helper: 'Danger Red, Tap Shoe and Blue Blossom',
    colorList: <Color>[
      Color(0xFFD9514E),
      Color(0xFF2A2B2D),
      Color(0xFF2DA8D8),
    ],
  ),
  NotesColorTheme(
    prefix: 'Light Teal',
    helper: null,
    colorList: <Color>[
      Color(0xFFA7BEAE),
    ],
  ),
  NotesColorTheme(
    prefix: 'Fresh Mint',
    helper: null,
    colorList: <Color>[
      Color(0xFFADEFD1),
    ],
  ),
  NotesColorTheme(
    prefix: 'Sailor Blue',
    helper: null,
    colorList: <Color>[
      Color(0xFF00203F),
    ],
  ),
];

Color getFontColorForBackground(Color background) {
  return (background.computeLuminance() > 0.179) ? Colors.black : Colors.white;
}
