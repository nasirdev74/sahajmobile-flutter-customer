import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryButton({super.key, required this.label, this.onPressed, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A237E),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF1A237E).withOpacity(0.6),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.25),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
            : Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
