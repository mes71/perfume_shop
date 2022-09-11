import 'package:flutter/material.dart';
import 'package:perfume_shop/data/constants.dart';
import 'package:perfume_shop/data/model/ProductModel.dart';
import 'package:perfume_shop/ui/product/ProductScreen.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductScreen.tag, arguments: productModel.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.transparent,
          elevation: 3,
          child: Container(
            width: MediaQuery.of(context).size.width - 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productModel.bgColor),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12)),
                        color: Color.fromARGB(255, 242, 242, 242)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                productModel.title!,
                                style: const TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Size',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    productModel.size.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Price',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    "\$${productModel.price}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Expanded(
                    child: Hero(
                      tag: tagProduct,
                      child: AspectRatio(
                        aspectRatio:1.3,
                        child: Image.asset(
                          productModel.image.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
