import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 22),
      child: SliderTheme(
        data: SliderThemeData(
          thumbShape: SliderComponentShape.noThumb,
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          value: value,
          max: 10,
          activeColor: const Color(0xff1BC61B),
          inactiveColor: const Color(0xff5C5F5C),
          onChanged: (double value) {},
        ),
      ),
    );
  }
}
