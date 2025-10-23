import 'package:flutter/material.dart';
import 'package:app/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key, required this.text, this.icon = Icons.info_outline_rounded});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 16.w, color: Colors.grey.shade700),
          SizedBox(width: 8.w),
          Text(text, style: bodyMedium.copyWith(fontSize: 13.sp)),
        ],
      ),
    );
  }
}
