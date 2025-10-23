import 'package:intl/intl.dart';
import 'package:app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/presentation/models/confirm_installment_nav_params.dart';

class RepaymentTimeline extends StatelessWidget {
  const RepaymentTimeline({super.key, required this.navParams});

  final ConfirmInstallmentNavParams navParams;

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final fixedDayOfMonth = currentDate.day > 28 ? 28 : currentDate.day;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(navParams.paymentTerm, (index) {
          final termNumber = index + 1;
          final paymentDate = DateTime(currentDate.year, currentDate.month + index, fixedDayOfMonth);
          final isLast = index == navParams.paymentTerm - 1;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      DateFormat('MMM dd yyyy').format(paymentDate),
                      style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: BoxDecoration(color: Colors.grey.shade500, shape: BoxShape.circle),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    currencyFormatter.format(navParams.monthlyPayment),
                    style: TextStyle(fontSize: 15.sp, color: ColorConst.gray600, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    getTermLabel(termNumber),
                    style: TextStyle(fontSize: 15.sp, color: Colors.grey.shade500, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                ],
              ),
              if (!isLast)
                Row(
                  children: [
                    SizedBox(width: 113.w),
                    Container(height: 20.w, width: 1.w, color: Colors.grey.shade500),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
