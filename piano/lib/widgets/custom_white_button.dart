import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomWhiteButton extends StatelessWidget {
  const CustomWhiteButton({
    super.key,
    required this.title,
    required this.nota,
  });

  final String title;
  final String nota;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Column(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(bottom: 20),
                backgroundColor: const Color(0xffF7F7F7),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xffC3C3C3), width: 0.5),
                  borderRadius: BorderRadius.circular(1),
                ),
                minimumSize: const Size(64, 100),
              ),
              onPressed: () {
                AudioPlayer().play(AssetSource('notes/$nota.mp3'));
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 8,
            width: 64,
            color: const Color.fromARGB(255, 198, 198, 198),
          ),
        ],
      ),
    );
  }
}
