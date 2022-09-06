import 'package:flutter/material.dart';
import 'package:perfume_shop/data/constants.dart';

class ProductScreen extends StatefulWidget {
  static String tag = '/ProductScreen_Route';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                tag: tagProduct,
                child: Image.asset(
                  args['image'],
                  height: 350,
                  width: double.infinity,
                ))
          ],
        ),
      ),
    );
  }
}
