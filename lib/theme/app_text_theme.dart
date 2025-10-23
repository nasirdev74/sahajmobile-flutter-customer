import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme {
  static TextTheme get light => TextTheme(
    headlineMedium: GoogleFonts.roboto(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xFF212121)),
    labelLarge: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF424242)),
    bodyLarge: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF212121)),
    bodyMedium: GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.normal, color: const Color(0xFF757575)),
  );

  static TextTheme get dark => light.copyWith(
    headlineMedium: light.headlineMedium?.copyWith(color: Colors.white),
    labelLarge: light.labelLarge?.copyWith(color: Colors.white70),
    bodyLarge: light.bodyLarge?.copyWith(color: Colors.white),
    bodyMedium: light.bodyMedium?.copyWith(color: Colors.white60),
  );
}
