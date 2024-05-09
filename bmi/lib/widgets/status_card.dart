import 'package:bmi/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: AppColors.cardColor,
        margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: widget,
      ),
    );
  }
}
