import 'package:flutter/material.dart';
import 'package:app/presentation/widgets/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryBottomBar extends StatelessWidget {
  const PrimaryBottomBar({super.key, required this.label, required this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.w),
      child: PrimaryButton(label: label, onPressed: onPressed),
    );
  }
}
