import 'package:flutter/material.dart';
import 'package:perfume_shop/main.dart';
import 'package:perfume_shop/ui/TestCont.dart';
import 'package:perfume_shop/ui/product/ProductScreen.dart';
import 'package:perfume_shop/ui/utils/MyConstant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myprimaryswatch,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        ProductScreen.tag: (context) => const ProductScreen()
      },
    );
  }
}
