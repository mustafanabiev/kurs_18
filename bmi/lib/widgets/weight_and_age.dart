import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/widgets/remove_add_button.dart';
import 'package:flutter/material.dart';

class WeightAndAge extends StatelessWidget {
  const WeightAndAge({
    super.key,
    required this.text,
    required this.value,
    required this.remove,
    required this.add,
  });

  final String text;
  final int value;
  final void Function(int) remove;
  final void Function(int) add;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.greyColor,
          ),
        ),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: AppColors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RemoveAddButton(
              onPressed: () => remove(value - 1),
              icon: Icons.remove,
            ),
            const SizedBox(width: 10),
            RemoveAddButton(
              onPressed: () => add(value + 1),
              icon: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}

// san--
// san = san - 1
// san++
