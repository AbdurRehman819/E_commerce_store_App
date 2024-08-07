import 'package:e_commerece_app/Provider/cart_provider.dart';
import 'package:e_commerece_app/Provider/fav_provider.dart';
import 'package:e_commerece_app/views/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => CartProvider())),
        ChangeNotifierProvider(create: ((context) => FavProvider())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const NavBarScreen(),
      ),
    );
  }
}
