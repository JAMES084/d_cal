import 'package:d_cal/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/profile/body_content.dart';
import 'views/profile/side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: const BodyContent(),
        tablet: const BodyContent(),
        desktop: Row(
          children: [
            Expanded(
              flex: size.width >= 1200 ? 2 : 3,
              child: const SideMenu(),
            ),
            Expanded(
              flex: size.width >= 1200 ? 7 : 10,
              child: const BodyContent(),
            ),
          ],
        ),
      ),
    );
  }
}
