import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppFont {
  static TextStyle Bold20 = GoogleFonts.poppins(
    color: AppColor.mainText,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle regular16 = GoogleFonts.poppins(
    color: AppColor.mainText,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
