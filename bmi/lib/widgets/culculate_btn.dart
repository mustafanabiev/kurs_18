import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_text.dart';
import 'package:flutter/material.dart';

class CulculateBtn extends StatelessWidget {
  const CulculateBtn({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 73,
        color: AppColors.redColor,
        child: const Center(
          child: Text(
            AppText.calculator,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
