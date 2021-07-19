import 'package:flutter/material.dart';
import 'package:naturalwallpaper/shotShari.dart';

import 'long_shari.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final pages = [ShortShari(), LongShari() ];
  final pageController = PageController(initialPage: 0);
  int currentstate = 0;
  @override
  Widget build(BuildContext context) {
    DecorationImage(image:AssetImage('image/1.jpg'),fit: BoxFit.cover);
    return Scaffold(body: PageView.builder(
      controller: pageController,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return pages[index];
      },
      onPageChanged: (int index) {
        setState(() {
          currentstate = index;
        });
      },
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentstate,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Short",),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Long"),
    ],
      ),
    );
  }
}
