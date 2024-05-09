import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_text.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.currentValue,
    required this.onChanged,
  });

  final double currentValue;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          AppText.height,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.greyColor,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${currentValue.toInt()}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'cm',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.greyColor,
                height: 2.1,
              ),
            ),
          ],
        ),
        Slider(
          value: currentValue,
          max: 300,
          onChanged: onChanged,
          activeColor: AppColors.white,
          thumbColor: AppColors.redColor,
          inactiveColor: AppColors.greyColor,
        ),
      ],
    );
  }
}
