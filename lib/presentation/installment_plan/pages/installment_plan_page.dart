import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/core/app_constant.dart';
import 'package:app/theme/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/presentation/widgets/primary_app_bar.dart';
import 'package:app/presentation/widgets/primary_info_row.dart';
import 'package:app/presentation/widgets/primary_bottom_bar.dart';
import 'package:app/presentation/installment_plan/widgets/info_banner.dart';
import 'package:app/presentation/installment_plan/widgets/term_selector.dart';
import 'package:app/presentation/installment_plan/widgets/down_payment_selector.dart';
import 'package:app/presentation/confirm_installment/pages/confirm_installment_page.dart';

class InstallmentPlanPage extends StatefulWidget {
  const InstallmentPlanPage({super.key, required this.orderAmount});

  final double orderAmount;
  static const route = '/installment_plan_page';

  @override
  State<InstallmentPlanPage> createState() => _InstallmentPlanPageState();
}

class _InstallmentPlanPageState extends State<InstallmentPlanPage> {
  int downPaymentPercent = 15;
  int terms = 9;

  @override
  Widget build(BuildContext context) {
    final monthlyPayment = ((widget.orderAmount * (100 - downPaymentPercent)) / 100) / terms;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF6F5Fa),
      appBar: const PrimaryAppBar(title: 'Installment Plan'),
      bottomNavigationBar: PrimaryBottomBar(
        onPressed: () => context.pushNamed(ConfirmInstallmentPage.route),
        label: 'Next',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryInfoRow(
                      label: 'Order Amount',
                      valueColor: ColorConst.primary,
                      padding: EdgeInsets.symmetric(vertical: 20.w),
                      value: 'TK ${widget.orderAmount.toStringAsFixed(2)}',
                    ),
                    SizedBox(height: 10.w),
                    const InfoBanner(text: 'Loan Service Provided by ${AppConstant.appName}'),
                    Divider(height: 1.w, color: Colors.grey.shade200, thickness: 1.w),
                    PrimaryInfoRow(
                      label: 'Down Payment',
                      value: 'TK 234.23',
                      valueColor: ColorConst.primary,
                      padding: EdgeInsets.only(top: 20.w, bottom: 10.w),
                    ),
                    DownPaymentSelector(
                      selectedPercent: downPaymentPercent,
                      onChanged: (p) => setState(() => downPaymentPercent = p),
                    ),

                    PrimaryInfoRow(
                      label: 'Monthly Payment',
                      value: 'Pay in $terms Terms',
                      padding: EdgeInsets.only(top: 20.w),
                    ),
                    TermSelector(selectedTerms: terms, onChanged: (t) => setState(() => terms = t)),
                    SizedBox(height: 10.w),
                    PrimaryInfoRow(
                      label: 'Service Fee Rate',
                      value: '2%/Month',
                      padding: EdgeInsets.only(top: 20.w, bottom: 10.w),
                    ),
                    PrimaryInfoRow(
                      label: 'On-site Payment',
                      value: 'TK ${monthlyPayment.toStringAsFixed(0)}',
                      valueColor: ColorConst.primary,
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                    ),
                    PrimaryInfoRow(
                      label: 'Monthly Payment',
                      value: 'TK ${monthlyPayment.toStringAsFixed(0)}',
                      valueColor: ColorConst.primary,
                      padding: EdgeInsets.only(top: 10.w, bottom: 20.w),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
