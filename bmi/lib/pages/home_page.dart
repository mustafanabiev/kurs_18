import 'dart:math';

import 'package:bmi/utils/app_colors.dart';
import 'package:bmi/utils/app_text.dart';
import 'package:bmi/widgets/alert_dialog.dart';
import 'package:bmi/widgets/culculate_btn.dart';
import 'package:bmi/widgets/gender_widget.dart';
import 'package:bmi/widgets/slider_widget.dart';
import 'package:bmi/widgets/status_card.dart';
import 'package:bmi/widgets/weight_and_age.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double height = 180;
  int weight = 60;
  int age = 28;
  bool isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          AppText.appBar,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                    widget: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFemale = false;
                        });
                      },
                      child: GenderWidget(
                        icon: Icons.male,
                        text: AppText.male,
                        isFemale: !isFemale,
                      ),
                    ),
                  ),
                  StatusCard(
                    widget: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFemale = true;
                        });
                      },
                      child: GenderWidget(
                        icon: Icons.female,
                        text: AppText.female,
                        isFemale: isFemale,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StatusCard(
              widget: SliderWidget(
                currentValue: height,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  StatusCard(
                    widget: WeightAndAge(
                      remove: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                      add: (maani) {
                        setState(() {
                          weight = maani;
                        });
                      },
                      text: AppText.weight,
                      value: weight,
                    ),
                  ),
                  StatusCard(
                    widget: WeightAndAge(
                      remove: (value) {
                        setState(() {
                          age = value;
                        });
                      },
                      add: (maani) {
                        setState(() {
                          age = maani;
                        });
                      },
                      text: AppText.age,
                      value: age,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CulculateBtn(
        onTap: () {
          final result = weight / pow(height / 100, 2);

          if (result < 18.5) {
            alertDialog(
              context: context,
              text: 'Салмак аз',
              result: result,
              title: 'Сенин салмагың аз. Көп тамактан!!!',
              color: Colors.red,
            );
          } else if (result >= 18.5 && result <= 24.9) {
            alertDialog(
              context: context,
              text: 'Нормалдуу',
              result: result,
              title: 'Сенин салмагың жакшы. Азаматсың!!!',
              color: Colors.green,
            );
          } else if (result > 24.9) {
            alertDialog(
              context: context,
              text: 'Салмак көп',
              result: result,
              title: 'Сенин салмагың көп. Спорт менен алектен!!!',
              color: Colors.red,
            );
          } else {
            alertDialog(
              context: context,
              text: 'Ката бар!!!',
              result: 0,
              title: 'Тиркемеде катачылык бар!!!',
              color: Colors.red,
            );
          }
        },
      ),
    );
  }
}
