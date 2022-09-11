import 'package:flutter/material.dart';
import 'package:perfume_shop/data/constants.dart';
import 'package:perfume_shop/data/model/ProductModel.dart';

class TestCon extends StatelessWidget {
  TestCon({Key? key}) : super(key: key);
  ProductModel productModel = ProductModel.fromJson(productList[1]);

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery
        .of(context)
        .size
        .width;
    double factor = MediaQuery
        .of(context)
        .textScaleFactor;
    double mHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 5,
            backgroundColor: productModel.bgColor,
            expandedHeight: mHeight * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                productModel.title!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                    letterSpacing: 1.2),
                textScaleFactor: factor,
              ),

              background: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  productModel.image!,

                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: 10, (_, int index) {
              return ListTile(
                title: Text(
                  productModel.description!,
                  style: TextStyle(fontSize: 13, color: Colors.black87),

                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
