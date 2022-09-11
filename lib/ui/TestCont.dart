import 'package:flutter/material.dart';
import 'package:perfume_shop/ui/utils/AppCipper.dart';

class TestCon extends StatelessWidget {
  const TestCon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ClipPath(
          clipper: AppClipper(20, 50, 50),
          child: Container(
            width: 200,
            height: 500,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
