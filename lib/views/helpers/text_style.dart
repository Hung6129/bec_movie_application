import 'package:bec_movie_application/views/helpers/palettes.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

extension ExtendedTextStyle on TextStyle {
  TextStyle get normalText {
    return copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: Palettes.textBlack,
    );
  }

  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get italic {
    return copyWith(
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get fontHeader {
    return copyWith(
      fontSize: 35,
      letterSpacing: 2,
      height: 12 / 10,
      fontWeight: FontWeight.w800,
      color: Palettes.p3,
      fontStyle: FontStyle.normal,
    );
  }

  TextStyle get fontTitle {
    return copyWith(
      fontSize: 22,
      height: 12 / 10,
    );
  }

  TextStyle get fontMedium {
    return copyWith(
      fontSize: 18,
      height: 12 / 10,
    );
  }

  TextStyle get fontOverview {
    return copyWith(
      fontSize: 16,
      height: 12 / 10,
    );
  }

  TextStyle get semibold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get text1Color {
    return copyWith(color: Palettes.p3);
  }

  TextStyle get whiteTextColor {
    return copyWith(color: Colors.white);
  }

  // convenience functions
  TextStyle setColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle setTextSize(double size) {
    return copyWith(fontSize: size);
  }
}

class TextStyles {
  TextStyles(this.context);

  BuildContext? context;

  static TextStyle defaultStyle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: Palettes.textBlack,
  );
  static TextStyle customStyle = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: Palettes.textBlack,
  );
}

// How to use?
// Text('test text', style: TextStyles.normalText.semibold.whiteColor);
// Text('test text', style: TextStyles.itemText.whiteColor.bold);