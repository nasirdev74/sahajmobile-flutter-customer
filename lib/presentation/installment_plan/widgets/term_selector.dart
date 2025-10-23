import 'selected_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermSelector extends StatelessWidget {
  final int selectedTerms;
  final ValueChanged<int> onChanged;

  const TermSelector({super.key, required this.selectedTerms, required this.onChanged});

  static const List<int> _terms = [4, 6, 9];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.w, bottom: 20.w),
      child: Row(
        children: _terms
            .asMap()
            .entries
            .map((entry) {
              final int index = entry.key;
              final int term = entry.value;
              final bool isSelected = selectedTerms == term;

              return [
                SelectedChip(label: '$term Terms', isSelected: isSelected, onTap: () => onChanged(term)),
                if (index < _terms.length - 1) SizedBox(width: 12.w),
              ];
            })
            .expand((widget) => widget)
            .toList(),
      ),
    );
  }
}
