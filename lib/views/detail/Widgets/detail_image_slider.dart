import 'package:flutter/material.dart';

class MYImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final String image;
  const MYImageSlider({super.key, required this.image, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: PageView.builder(
          itemBuilder: (context, index) {
            return Hero(tag: image, child: Image.asset(image));
          },
          onPageChanged: onChange,
        ));
  }
}
