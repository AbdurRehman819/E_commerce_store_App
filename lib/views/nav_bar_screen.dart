import 'package:e_commerece_app/colors.dart';
import 'package:e_commerece_app/views/Cart/cart_screen.dart';
import 'package:e_commerece_app/views/Home/home_screen.dart';
import 'package:e_commerece_app/views/favourite_screen/favourite.dart';
import 'package:e_commerece_app/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreen();
}

class _NavBarScreen extends State<NavBarScreen> {
  int currentIndex = 2;
  List screens = [
    const Scaffold(),
    const FavouriteScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.grid_view_outlined,
                  size: 25,
                  color:
                      currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.favorite_border,
                  size: 30,
                  color:
                      currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
                )),
            const SizedBox(
              width: 15,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart_checkout_outlined,
                  size: 30,
                  color:
                      currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color:
                      currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
                )),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
