import 'package:bmi/utils/app_colors.dart';
import 'package:flutter/material.dart';

Future<void> alertDialog({
  required BuildContext context,
  required String text,
  required double result,
  required String title,
  required Color color,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.cardColor,
        title: const Text(
          'Жыйынтык',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              // result.toInt().toString(),
              '${result.toInt()}',

              style: const TextStyle(
                color: AppColors.white,
                fontSize: 80,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.redColor,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Кайра эсепте',
              style: TextStyle(color: AppColors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
