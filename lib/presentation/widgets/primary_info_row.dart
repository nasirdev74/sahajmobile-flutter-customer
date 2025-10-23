import 'package:flutter/material.dart';
import 'package:app/theme/color_const.dart';
import 'package:app/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryInfoRow extends StatelessWidget {
  const PrimaryInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor = ColorConst.gray900,
    required this.padding,
  });

  final String label;
  final String value;
  final Color valueColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: labelLarge),
            Text(value, style: bodyLarge.copyWith(color: valueColor)),
          ],
        ),
      ),
    );
  }
}
