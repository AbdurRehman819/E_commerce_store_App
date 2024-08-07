import 'package:e_commerece_app/colors.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String desc;
  const Description({super.key, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              alignment: Alignment.center,
              width: 120,
              child:  const Text(
                "Description",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(20)),
            ),
            const Text(
              "Specifications",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            const Text(
              "Reviews",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          desc,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        )
      ],
    );
  }
}
