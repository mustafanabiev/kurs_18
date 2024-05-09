import 'package:bmi/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RemoveAddButton extends StatelessWidget {
  const RemoveAddButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(4),
        backgroundColor: AppColors.greyColor,
        foregroundColor: AppColors.redColor,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
