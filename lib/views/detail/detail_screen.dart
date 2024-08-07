import 'package:e_commerece_app/Models/product_data.dart';
import 'package:e_commerece_app/colors.dart';
import 'package:e_commerece_app/views/detail/Widgets/add_to_cart.dart';
import 'package:e_commerece_app/views/detail/Widgets/description.dart';
import 'package:e_commerece_app/views/detail/Widgets/detail_app_bar.dart';
import 'package:e_commerece_app/views/detail/Widgets/detail_image_slider.dart';
import 'package:e_commerece_app/views/detail/Widgets/item_detail.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var currentImage = 0;
  var currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: kcontentColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            DetailAppBar(product: widget.product),
            MYImageSlider(
                image: widget.product.image,
                onChange: (index) {
                  setState(() {
                    currentImage = index;
                  });
                }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                        duration: const Duration(
                          microseconds: 300,
                        ),
                        width: currentImage == index ? 15 : 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: currentImage == index
                                ? Colors.black
                                : Colors.transparent,
                            border: Border.all(color: Colors.black)),
                      )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 100),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemDetail(
                    product: widget.product,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Colors",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: List.generate(
                        widget.product.colors.length,
                        (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentColor = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentColor == index
                                      ? Colors.white
                                      : widget.product.colors[index],
                                  border: currentColor == index
                                      ? Border.all(
                                          color: widget.product.colors[index])
                                      : null,
                                ),
                                padding: currentColor == index
                                    ? const EdgeInsets.all(2)
                                    : null,
                                margin: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: widget.product.colors[index]),
                                ),
                              ),
                            )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Description(
                    desc: widget.product.description,
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
