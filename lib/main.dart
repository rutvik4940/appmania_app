import 'package:appmania/screen/home_screen/homescreen.dart';
import 'package:appmania/screen/product_screen//productscreen.dart';
import 'package:appmania/screen/cart_screen/cartscreen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
            "/":(context)=>HomeScreen(),
            "item":(context)=>ItemScreen(),
            "cart":(context)=>CartScreen(),
          }
      )
  );
}
