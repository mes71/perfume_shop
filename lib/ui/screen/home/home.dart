import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfume_shop/data/constants.dart';
import 'package:perfume_shop/ui/screen/product/ProductScreen.dart';
import 'package:perfume_shop/ui/utils/MyConstant.dart';
import 'package:perfume_shop/ui/widget/ProductList.dart';
import 'package:perfume_shop/ui/widget/SideMenu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // initialize a index
  int _selectedIndex = 0;
  //for filter gender
  String genderFilter = '';
  //for filter sort by
  String otherFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            //region side Menu
            SideMenu(
                selectedMenu: _selectedIndex,
                onSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
            //endregion
            const VerticalDivider(thickness: 1, width: 2),
            Expanded(
                child: Column(
              children: [
                //region Gender Filter
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 14, 8, 8),
                  child: Row(
                    children: [
                      const Text(
                        'Gender: ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Flexible(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List<Widget>.generate(
                            genderList.length,
                            (int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: FilterChip(
                                  label: Text(genderList[index]),
                                  selected: genderList[index] == genderFilter,
                                  selectedColor: myprimaryswatchAccent,
                                  checkmarkColor: Colors.white,
                                  onSelected: (bool selected) {
                                    setState(() {
                                      if (genderFilter == genderList[index]) {
                                        genderFilter = '';
                                      } else {
                                        genderFilter = genderList[index];
                                      }
                                    });
                                  },
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      )),
                    ],
                  ),
                ),
                //endregion

                //region other Filter
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 8, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sort By: ',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 0, 8, 8),
                            child: Row(
                                children: List<Widget>.generate(
                              otherFilterProductList.length,
                              (int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: FilterChip(
                                    label: Text(otherFilterProductList[index]),
                                    selected: otherFilterProductList[index] ==
                                        otherFilter,
                                    selectedColor: myprimaryswatchAccent,
                                    checkmarkColor: Colors.white,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        if (otherFilter ==
                                            otherFilterProductList[index]) {
                                          otherFilter = '';
                                        } else {
                                          otherFilter =
                                              otherFilterProductList[index];
                                        }
                                      });
                                    },
                                  ),
                                );
                              },
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //endregion

                //region ProductList
                Expanded(
                    flex: 1,
                    child: ProductListScreen()),
                //endregion

                //region Basket Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              const Size.fromHeight(50))),
                      onPressed: () {
                        debugPrint(
                            MediaQuery.of(context).padding.left.toString());
                        debugPrint(
                            MediaQuery.of(context).viewPadding.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('See Your card'),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      )),
                )
                //endregion
              ],
            )),
          ],
        ),
      ),
    );
  }
}
