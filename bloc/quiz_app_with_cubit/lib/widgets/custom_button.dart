import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.tuuraButtonbu,
    required this.baskanda,
  });

  final bool tuuraButtonbu;
  final void Function(bool) baskanda;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          onPressed: () => baskanda(tuuraButtonbu),
          style: ElevatedButton.styleFrom(
            backgroundColor: tuuraButtonbu == true
                ? const Color(0xff4CB050)
                : const Color(0xffEF443A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(
            tuuraButtonbu == true ? 'Туура' : 'Туура эмес',
            style: const TextStyle(
              fontSize: 32,
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
