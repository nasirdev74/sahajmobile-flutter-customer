import 'package:flutter/material.dart';
import 'package:app/presentation/core/primary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstallmentPlanPageBottomBar extends StatelessWidget {
  const InstallmentPlanPageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.w),
      child: PrimaryButton(label: 'Next', onPressed: () {}),
    );
  }
}
