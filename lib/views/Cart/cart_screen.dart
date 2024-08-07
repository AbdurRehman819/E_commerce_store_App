import 'package:e_commerece_app/Provider/cart_provider.dart';
import 'package:e_commerece_app/colors.dart';
import 'package:e_commerece_app/views/Cart/check_out_box.dart';
import 'package:e_commerece_app/views/nav_bar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finallist = provider.cart;
    productQuqntity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add
                ? provider.incrementQtn(index)
                : provider.decrementQtn(index);
          });
        },
        child: Icon(icon, size: 20),
      );
    }

    return Scaffold(
      bottomSheet: const CheckOutBox(),
      backgroundColor: kcontentColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const NavBarScreen())));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    // size: 25,
                  ),
                ),
                const Text(
                  "My cart",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container()
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: finallist.length,
                itemBuilder: (context, index) {
                  final cartItem = finallist[index];
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          padding: const EdgeInsets.all(10),
                          child: Row(children: [
                            Container(
                              height: 100,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(cartItem.image),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cartItem.category,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "\$${cartItem.price}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ]),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        right: 35,
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                finallist.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 2)),
                              child: Row(children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                productQuqntity(Icons.remove, index),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  cartItem.quantity.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                productQuqntity(Icons.add, index),
                                const SizedBox(
                                  width: 10,
                                ),
                              ]),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      )),
    );
  }
}
