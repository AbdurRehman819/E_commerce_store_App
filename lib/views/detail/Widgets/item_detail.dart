import 'package:e_commerece_app/Models/product_data.dart';
import 'package:e_commerece_app/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final Product product;
  const ItemDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),
        Text(
          "\$${product.price}",
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kprimaryColor),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    product.rate.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              product.review,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
            ),
            const Spacer(),
            const Text(
              "Seller:",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              product.seller,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
