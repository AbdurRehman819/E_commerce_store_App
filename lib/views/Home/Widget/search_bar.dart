import 'package:e_commerece_app/colors.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      decoration: BoxDecoration(
          color: kcontentColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
          Flexible(
              flex: 4,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search here", border: InputBorder.none),
              )),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.tune,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}
