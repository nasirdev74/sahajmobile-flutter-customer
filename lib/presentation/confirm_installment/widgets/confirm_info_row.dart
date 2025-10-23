import 'package:flutter/material.dart';
import 'package:app/theme/color_const.dart';
import 'package:app/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmInfoRow extends StatelessWidget {
  const ConfirmInfoRow({super.key, required this.label, required this.value, this.valueColor = ColorConst.gray900});

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: labelLarge.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          Text(value, style: bodyLarge.copyWith(color: valueColor)),
        ],
      ),
    );
  }
}
