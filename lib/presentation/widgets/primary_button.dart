import 'package:flutter/material.dart';
import 'package:app/theme/color_const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, this.onPressed, this.isLoading = false});

  final String label;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 4,
          foregroundColor: Colors.white,
          backgroundColor: ColorConst.primary,
          shadowColor: Colors.black.withOpacity(0.25),
          disabledBackgroundColor: ColorConst.primary.withOpacity(0.6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              : Text(
                  label,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    letterSpacing: 0.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
