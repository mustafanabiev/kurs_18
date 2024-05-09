import 'package:flutter/material.dart';
import 'package:game_test/constants/app_colors.dart';
import 'package:game_test/constants/app_text.dart';
import 'package:game_test/model/suroo_model.dart';

class Continents {
  Continents({
    required this.text,
    required this.icon,
    required this.color,
    this.suroo,
  });

  final String text;
  final String icon;
  final Color color;
  List<Suroo>? suroo;
}

final europe = Continents(
  text: AppText.europe,
  icon: 'europe',
  color: AppColors.blueImageColor,
  suroo: europaQuestions,
);

final asia = Continents(
  text: AppText.asia,
  icon: 'asia',
  color: AppColors.asia,
  suroo: asiaQuestions,
);

final northAmerica = Continents(
  text: AppText.northAmerica,
  icon: 'north_america',
  color: AppColors.northAmerica,
);

final southAmerica = Continents(
  text: AppText.southAmerica,
  icon: 'south_america',
  color: AppColors.southAmerica,
);

final africa = Continents(
  text: AppText.africa,
  icon: 'africa',
  color: AppColors.africa,
);

final australia = Continents(
  text: AppText.australia,
  icon: 'australia',
  color: AppColors.australia,
);

List<Continents> continents = [
  europe,
  asia,
  northAmerica,
  southAmerica,
  africa,
  australia,
];
