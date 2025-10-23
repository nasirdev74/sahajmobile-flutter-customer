import 'package:flutter/material.dart';
import 'package:app/theme/color_const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ColorConst.primary,
    scaffoldBackgroundColor: ColorConst.background,

    textTheme: TextTheme(
      headlineMedium: GoogleFonts.roboto(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorConst.gray900,
        letterSpacing: 0.15,
      ),
      labelLarge: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorConst.gray800),
      bodyLarge: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorConst.gray900),
      bodyMedium: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.normal, color: ColorConst.gray600),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: ColorConst.gray900,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.roboto(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorConst.gray900),
      iconTheme: const IconThemeData(color: ColorConst.gray900),
      actionsIconTheme: const IconThemeData(color: ColorConst.gray900),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorConst.primary,
        foregroundColor: Colors.white,
        disabledBackgroundColor: ColorConst.primary.withOpacity(0.6),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.25),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        textStyle: GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w500, letterSpacing: 0.5),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      titleTextStyle: GoogleFonts.roboto(fontSize: 20.sp, fontWeight: FontWeight.bold, color: ColorConst.gray900),
      contentTextStyle: GoogleFonts.roboto(fontSize: 14.sp, color: ColorConst.gray900),
    ),

    dividerColor: ColorConst.divider,
  );

  static ThemeData dark = light.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: light.textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white70),
    appBarTheme: light.appBarTheme.copyWith(backgroundColor: const Color(0xFF1F1F1F), foregroundColor: Colors.white),
  );
}
