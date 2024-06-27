import 'package:flutter/material.dart';

class ResultIcon extends StatelessWidget {
  const ResultIcon({
    super.key,
    required this.tuuraIconBu,
  });

  final bool tuuraIconBu;

  @override
  Widget build(BuildContext context) {
    return Icon(
      tuuraIconBu == true ? Icons.check : Icons.close,
      size: 40,
      color: tuuraIconBu == true
          ? const Color(0xff4CB050)
          : const Color(0xffEF443A),
    );
  }
}
