import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.onTap,
    required this.image,
    required this.author,
    required this.description,
    required this.time,
  });

  final void Function()? onTap;
  final String? image;
  final String author;
  final String description;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide()),
        ),
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: image != null
                  ? Image.network(image!)
                  : Image.asset('assets/Rectangle.png'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
