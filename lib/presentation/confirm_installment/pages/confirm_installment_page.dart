import 'package:app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/presentation/widgets/primary_app_bar.dart';
import 'package:app/presentation/widgets/primary_bottom_bar.dart';
import 'package:app/presentation/models/confirm_installment_nav_params.dart';
import 'package:app/presentation/confirm_installment/widgets/confirm_info_row.dart';
import 'package:app/presentation/confirm_installment/widgets/repayment_timeline.dart';

class ConfirmInstallmentPage extends StatefulWidget {
  const ConfirmInstallmentPage({super.key, required this.navParams});

  final ConfirmInstallmentNavParams navParams;

  static const route = '/confirm_installment';

  @override
  State<ConfirmInstallmentPage> createState() => _ConfirmInstallmentPageState();
}

class _ConfirmInstallmentPageState extends State<ConfirmInstallmentPage> {
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
            ConfirmInfoRow(label: 'Payment Term', value: '${widget.navParams.paymentTerm} Months'),
            ConfirmInfoRow(label: 'Repayment Options', value: widget.navParams.repaymentOptions),
            ConfirmInfoRow(
              label: 'Total Price',
              valueColor: ColorConst.primary,
              value: currencyFormatter.format(widget.navParams.totalPrice),
            ),
            ConfirmInfoRow(
              label: 'Down Payment',
              valueColor: ColorConst.primary,
              value: currencyFormatter.format(widget.navParams.downPayment),
            ),
            ConfirmInfoRow(
              label: 'Total Outstanding',
              valueColor: ColorConst.primary,
              value: currencyFormatter.format(widget.navParams.totalOutstanding),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: Divider(height: 1.w, color: Colors.grey.shade200, thickness: 1.w),
            ),
            ConfirmInfoRow(
              label: 'Repayment Plan',
              valueColor: ColorConst.primary,
              value: 'Total ${widget.navParams.paymentTerm} Terms',
            ),
            RepaymentTimeline(navParams: widget.navParams),
          ],
        ),
      ),
    );
  }
}
