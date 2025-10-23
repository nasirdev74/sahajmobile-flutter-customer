import 'package:app/presentation/widgets/primary_info_row.dart';
import 'package:flutter/material.dart';
import 'package:app/presentation/widgets/primary_app_bar.dart';
import 'package:app/presentation/widgets/primary_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmInstallmentPage extends StatelessWidget {
  const ConfirmInstallmentPage({super.key});

  static const route = '/confirm_installment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF6F5Fa),
      appBar: const PrimaryAppBar(title: 'Confirm Information'),
      bottomNavigationBar: PrimaryBottomBar(label: 'Confirm', onPressed: () => {}),
      body: SafeArea(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            PrimaryInfoRow(
              label: 'Payment Term',
              value: '9 Months',
              padding: EdgeInsets.symmetric(vertical: 10.w),
            ),
          ],
        ),
      ),
    );
  }
}
