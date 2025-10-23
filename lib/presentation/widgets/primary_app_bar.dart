import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({super.key, required this.title, this.actions, this.onBackPressed, this.showLeading = true});

  final String title;
  final bool showLeading;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      centerTitle: false,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.black.withOpacity(0.1),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          fontSize: 20,
          letterSpacing: 0.15,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF212121),
        ),
      ),
      leading: showLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF212121), size: 20),
              onPressed: onBackPressed ?? () => Navigator.maybePop(context),
            )
          : null,
      actions:
          actions ??
          [
            IconButton(
              icon: const Icon(Icons.close, color: Color(0xFF212121), size: 24),
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              tooltip: 'Close',
            ),
          ],
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    );
  }
}
