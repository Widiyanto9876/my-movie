import 'package:flutter/material.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/Ipp7cegtub4t0mu7xaKLQkYoGc.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 13),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "title movie",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Release movie",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  "Description",
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
