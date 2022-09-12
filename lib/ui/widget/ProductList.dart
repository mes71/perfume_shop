import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/constants.dart';
import 'package:perfume_shop/ui/screen/product/ProductScreen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  //for favorite list
  List<int> favList = [];
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      initialItemCount: productList.length,
      itemBuilder: (BuildContext context, int index,
          Animation<double> animation) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductScreen.tag,
                arguments: productList[index]);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              color: Colors.transparent,
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width - 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: productList[index]['bgColor']),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0.5,
                        left: 30,
                        child: Container(
                          width: 45,
                          height: 80,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight:
                                Radius.circular(50),
                              )),
                          child: Center(
                            child: IconButton(
                                onPressed: () {
                                  if (favList.contains(
                                      productList[index]
                                      ['id'])) {
                                    favList.remove(
                                        productList[index]
                                        ['id']);
                                  } else {
                                    favList.add(
                                        productList[index]
                                        ['id']);
                                  }
                                  setState(() {});
                                },
                                icon: Icon(
                                  favList.contains(
                                      productList[index]
                                      ['id'])
                                      ? CupertinoIcons
                                      .heart_fill
                                      : CupertinoIcons.heart,
                                  size: 35,
                                  color: favList.contains(
                                      productList[index]
                                      ['id'])
                                      ? Colors.red
                                      : Colors.black,
                                )),
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomRight:
                                Radius.circular(12),
                                bottomLeft:
                                Radius.circular(12)),
                            color: Color.fromARGB(
                                255, 242, 242, 242)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    productList[index]['title'],
                                    style: const TextStyle(
                                        fontSize: 23,
                                        fontWeight:
                                        FontWeight.w700),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Size',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                        productList[index]
                                        ['size']
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight:
                                            FontWeight
                                                .w600),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Price',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight:
                                            FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "\$${productList[index]['price']}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight:
                                            FontWeight.w600,
                                            color:
                                            Colors.green),
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
                      top: 10,
                      bottom: 71,
                      right: 0,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            productList[index]['image'],
                            width: 150,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
