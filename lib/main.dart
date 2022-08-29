import 'package:flutter/material.dart';
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
              child: Center(
                child: Text('Page Number: $_selectedIndex'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
