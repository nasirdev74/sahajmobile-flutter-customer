import 'package:flutter/material.dart';
import 'package:app/presentation/core/primary_button.dart';
import 'package:app/presentation/core/primary_app_bar.dart';

class InstallmentPlanPage extends StatelessWidget {
  const InstallmentPlanPage({super.key, required this.orderAmount});

  final double orderAmount;

  static const route = '/installment_plan_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const PrimaryAppBar(title: 'Installment Plan'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: PrimaryButton(label: "Next", onPressed: () {}),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
