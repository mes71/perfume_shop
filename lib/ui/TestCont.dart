import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/constants.dart';
import 'package:perfume_shop/data/model/ProductModel.dart';

class TestCon extends StatelessWidget {
  TestCon({Key? key}) : super(key: key);
  ProductModel productModel = ProductModel.fromJson(productList[1]);

  @override
  Widget build(BuildContext context) {
    double mWidth = MediaQuery.of(context).size.width;
    double factor = MediaQuery.of(context).textScaleFactor;
    double mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                icon: const Icon(CupertinoIcons.chevron_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              elevation: 5,
              backgroundColor: productModel.bgColor,
              expandedHeight: mHeight * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 1.2),
                      textScaleFactor: factor,
                    ),
                  ],
                ),
                background: Padding(
                  padding: const EdgeInsets.only(bottom: 50, top: 10),
                  child: Image.asset(
                    productModel.image!,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 11, (_, int index) {
                return index == 10
                    ? SizedBox(
                        height: 80,
                      )
                    : ListTile(
                        title: Text(
                          productModel.description!,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black87),
                        ),
                      );
              }),
            ),
          ],
          physics: BouncingScrollPhysics(),
          anchor: 0.02,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Text('add to basket')),
    );
  }
}
