import 'package:e_commerece_app/Models/product_data.dart';
import 'package:e_commerece_app/colors.dart';
import 'package:e_commerece_app/views/Home/Widget/home_appbar.dart';
import 'package:e_commerece_app/views/Home/Widget/image_slider.dart';
import 'package:e_commerece_app/views/Home/Widget/product_card.dart';
import 'package:e_commerece_app/views/Home/Widget/search_bar.dart';
import 'package:flutter/material.dart';

import '../../Models/category_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategory = [
      all,
      shoes,
      beauty,
      womenFashion,
      menFashion,
      jewelry,
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ), //for appbar
                const CostumAppBar(),
                const SizedBox(
                  height: 20,
                ), //for search bar
                const MySearchBar(),
                const SizedBox(
                  height: 20,
                ), //for slider
                ImageSlider(
                    currentSlide: currentSlider,
                    onChange: (value) {
                      setState(() {
                        currentSlider = value;
                      });
                    }),
                const SizedBox(
                  height: 20,
                ), //for categories
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? kprimaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage(categories[index].image),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                categories[index].title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special for you",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black54),
                    )
                  ],
                ),
                GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: selectedCategory[selectedIndex].length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: ((context, index) {
                      return ProductCard(
                        product: selectedCategory[selectedIndex][index],
                      );
                    }))
              ],
            )),
      ),
    );
  }
}
