import 'package:e_commerece_app/Models/product_data.dart';
import 'package:e_commerece_app/Provider/fav_provider.dart';
import 'package:e_commerece_app/colors.dart';
import 'package:e_commerece_app/views/detail/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailScreen(
                      product: product,
                    )));
      },
      child: Stack(children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: kcontentColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Center(
                child: Hero(
                  tag: product.image,
                  child: Image.asset(
                    product.image,
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  product.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Row(
                  children: List.generate(
                      product.colors.length,
                      (index) => Container(
                          height: 18,
                          margin: const EdgeInsets.only(right: 4),
                          width: 18,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: product.colors[index]))),
                )
              ])
            ],
          ),
        ),
        Positioned(
            child: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 36,
            width: 36,
            decoration: const BoxDecoration(
                color: kprimaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(10))),
            child: GestureDetector(
              onTap: () {
                provider.toggleProduct(product);
              },
              child: Icon(
                provider.isExist(product)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ))
      ]),
    );
  }
}
