import 'package:flutter/material.dart';
import 'package:perfume_shop/data/constants.dart';
import 'package:perfume_shop/generated/assets.dart';
import 'package:perfume_shop/ui/product/ProductScreen.dart';
import 'package:perfume_shop/ui/utils/MyConstant.dart';
import 'package:perfume_shop/ui/widget/SideMenu.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // initialize a index
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // create a navigation rail
            SideMenu(
                selectedMenu: _selectedIndex,
                onSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
            const VerticalDivider(thickness: 1, width: 2),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: List<Widget>.generate(
                      3,
                      (int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                            label: Text('Item $index'),
                            selected: false,
                            selectedColor: myprimaryswatchAccent,
                            checkmarkColor: Colors.white,
                            onSelected: (bool selected) {
                              setState(() {
                                debugPrint("asdsadsadas");
                              });
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: List<Widget>.generate(
                      3,
                      (int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                            label: Text('Item $index'),
                            selected: false,
                            selectedColor: myprimaryswatchAccent,
                            checkmarkColor: Colors.white,
                            onSelected: (bool selected) {
                              setState(() {
                                debugPrint("asdsadsadas");
                              });
                            },
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                Flexible(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: productList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(ProductScreen.tag,
                                  arguments: productList[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: productList[index]['bgColor']),
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
                                                  SizedBox(
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
                                                      Text(
                                                        'Size',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text(
                                                        productList[index]
                                                                ['size']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Price',
                                                        style: TextStyle(
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        "\$${productList[index]['price']}",
                                                        style: TextStyle(
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
                                      top: 0,
                                      bottom: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Hero(
                                            tag: tagProduct,
                                            child: Image.asset(
                                              productList[index]['image'],
                                              width: 150,
                                              height: 200,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(Size.fromHeight(50))),
                      onPressed: () {},
                      child: Text('see Your card')),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
