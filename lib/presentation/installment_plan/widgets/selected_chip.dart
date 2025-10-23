import 'package:flutter/material.dart';
import 'package:app/theme/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedChip extends StatelessWidget {
  const SelectedChip({super.key, required this.label, required this.isSelected, required this.onTap});

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          height: 40.w,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: isSelected ? ColorConst.primary : const Color(0xFFe3e6f6),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : ColorConst.gray900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
