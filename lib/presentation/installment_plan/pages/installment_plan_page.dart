import 'package:app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/core/app_constant.dart';
import 'package:app/theme/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/presentation/widgets/primary_app_bar.dart';
import 'package:app/presentation/widgets/primary_bottom_bar.dart';
import 'package:app/presentation/installment_plan/widgets/info_row.dart';
import 'package:app/presentation/installment_plan/widgets/info_banner.dart';
import 'package:app/presentation/models/confirm_installment_nav_params.dart';
import 'package:app/presentation/installment_plan/widgets/term_selector.dart';
import 'package:app/presentation/installment_plan/widgets/down_payment_selector.dart';
import 'package:app/presentation/confirm_installment/pages/confirm_installment_page.dart';

class InstallmentPlanPage extends StatefulWidget {
  const InstallmentPlanPage({super.key, required this.productPrice});

  final int productPrice;
  static const route = '/installment_plan_page';

  @override
  State<InstallmentPlanPage> createState() => _InstallmentPlanPageState();
}

class _InstallmentPlanPageState extends State<InstallmentPlanPage> {
  var terms = 9;
  var downPayment = 0;
  var monthlyPayment = 0;
  var downPaymentPercent = 15;

  @override
  void initState() {
    super.initState();
    calculateDownPayment(downPaymentPercent);
    calculateMonthlyPayment(terms);
  }

  void calculateDownPayment(int percent) {
    if (mounted) {
      setState(() {
        downPaymentPercent = percent;
        downPayment = ((widget.productPrice * percent) / 100).ceil();
      });
    }
  }

  void calculateMonthlyPayment(int termsValue) {
    if (mounted) {
      setState(() {
        terms = termsValue;
        final remainingAmount = (widget.productPrice * (100 - downPaymentPercent)) / 100;
        monthlyPayment = (remainingAmount / termsValue).ceil();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF6F5Fa),
      appBar: const PrimaryAppBar(title: 'Installment Plan'),
      bottomNavigationBar: PrimaryBottomBar(
        onPressed: () {
          final navParams = ConfirmInstallmentNavParams(
            paymentTerm: terms,
            repaymentOptions: 'By Month',
            downPayment: downPayment,
            monthlyPayment: monthlyPayment,
            totalPrice: widget.productPrice,
            totalOutstanding: widget.productPrice - downPayment,
          );
          context.pushNamed(ConfirmInstallmentPage.route, extra: navParams);
        },
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
                    InfoRow(
                      label: 'Order Amount',
                      valueColor: ColorConst.primary,
                      padding: EdgeInsets.symmetric(vertical: 20.w),
                      value: currencyFormatter.format(widget.productPrice),
                    ),
                    SizedBox(height: 10.w),
                    const InfoBanner(text: 'Loan Service Provided by ${AppConstant.appName}'),
                    Divider(height: 1.w, color: Colors.grey.shade200, thickness: 1.w),
                    InfoRow(
                      label: 'Down Payment',
                      valueColor: ColorConst.primary,
                      value: currencyFormatter.format(downPayment),
                      padding: EdgeInsets.only(top: 20.w, bottom: 10.w),
                    ),
                    DownPaymentSelector(selectedPercent: downPaymentPercent, onChanged: (p) => calculateDownPayment(p)),

                    InfoRow(
                      label: 'Monthly Payment',
                      value: 'Pay in $terms Terms',
                      padding: EdgeInsets.only(top: 20.w),
                    ),
                    TermSelector(selectedTerms: terms, onChanged: (t) => calculateMonthlyPayment(t)),
                    SizedBox(height: 10.w),
                    InfoRow(
                      label: 'On-site Payment',
                      valueColor: ColorConst.primary,
                      value: currencyFormatter.format(downPayment),
                      padding: EdgeInsets.only(top: 20.w, bottom: 10.w),
                    ),
                    InfoRow(
                      label: 'Monthly Payment',
                      valueColor: ColorConst.primary,
                      value: currencyFormatter.format(monthlyPayment),
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
