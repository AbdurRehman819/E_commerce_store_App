



import 'package:e_commerece_app/colors.dart';
import 'package:flutter/material.dart';

class CostumAppBar extends StatelessWidget {
  const CostumAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {},
            icon: Image.asset(
              "images/icon.png",
              height: 25,
            )),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding:const  EdgeInsets.all(20),
          ),
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.notifications_none),
        )
      ],
    );
  }
}
