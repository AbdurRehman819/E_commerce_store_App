import 'package:e_commerece_app/Models/product_data.dart';
import 'package:e_commerece_app/Provider/cart_provider.dart';
import 'package:e_commerece_app/colors.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final Product product;
  const AddToCart({super.key, required this.product});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex != 0) {
                        currentIndex--;
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  currentIndex.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex++;
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 18,
                    color: Colors.white,
                  ),
                )
              ]),
            ),
            GestureDetector(
              onTap: () {
                provider.toggleProduct(widget.product);
                const snack = SnackBar(
                  content: Text(
                    "Added successfully!",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: kprimaryColor),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                alignment: Alignment.center,
                child: const Text(
                  "Add to cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
