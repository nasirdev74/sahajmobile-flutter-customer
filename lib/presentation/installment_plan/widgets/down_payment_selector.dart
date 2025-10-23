import 'selected_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownPaymentSelector extends StatelessWidget {
  final int selectedPercent;
  final ValueChanged<int> onChanged;

  const DownPaymentSelector({super.key, required this.selectedPercent, required this.onChanged});

  static const List<int> _percents = [15, 20, 30, 50];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: _percents
            .asMap()
            .entries
            .map((entry) {
              final int index = entry.key;
              final int percent = entry.value;
              final bool isSelected = selectedPercent == percent;

              return [
                SelectedChip(label: '$percent%', isSelected: isSelected, onTap: () => onChanged(percent)),
                if (index < _percents.length - 1) SizedBox(width: 12.w),
              ];
            })
            .expand((widget) => widget)
            .toList(),
      ),
    );
  }
}
