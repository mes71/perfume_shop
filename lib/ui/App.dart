import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_shop/ui/screen/home/home.dart';
import 'package:perfume_shop/ui/screen/product/ProductScreen.dart';
import 'package:perfume_shop/ui/utils/MyConstant.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts
            .lato()
            .fontFamily,
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
