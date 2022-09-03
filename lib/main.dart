import 'package:flutter/material.dart';
import 'package:perfume_shop/generated/assets.dart';
import 'package:perfume_shop/ui/utils/MyConstant.dart';
import 'package:perfume_shop/ui/widget/SideMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: myprimaryswatch,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // initialize a index
  int _selectedIndex = 0;
  var productList = [
    Assets.imagesPro1,
    Assets.imagesPro2,
    Assets.imagesPro3,
    Assets.imagesPro4,
    Assets.imagesPro5,
    Assets.imagesPro6,
    Assets.imagesPro7,
    Assets.imagesPro8,
    Assets.imagesPro9,
  ];

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
                        itemCount: 9,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent),
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
                                          color: Color.fromARGB(
                                              255, 242, 242, 242)),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 10,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          productList[index],
                                          width: 200,
                                          height: 400,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
