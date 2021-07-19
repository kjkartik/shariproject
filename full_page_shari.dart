
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naturalwallpaper/firebase.dart';
import 'package:naturalwallpaper/model_class.dart';
import 'package:naturalwallpaper/repositery.dart';

class FullPage extends StatefulWidget {

  _FullPageState createState() => _FullPageState();
}

class _FullPageState extends State<FullPage> {
  late final ModelClassShari shariPageView;

  late Uint8List _imageFile;
  // var screenshotController = ScreenshotController();
  final repositery = ShariRepositery();
  final firebase = Firebase();
  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<ModelClassShari> modelClassShari;
     getData() async {
    try {
      var image = await repositery.getShortShari();
      setState(() {
        modelClassShari = image;
      });
    } catch (e) {
      print(e);
      print('error in pageView');
    }
  }

  Widget build(BuildContext context) {
    // Navigator.of(context).pop();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          title: Center(
            child: Text(
              ' FULL PAGE',
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('image/1.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),

      body: ListView.builder(
         itemCount:null == modelClassShari ? 0
        : modelClassShari.length,
    itemBuilder: (BuildContext context, int index)
    {
    ModelClassShari  shari = modelClassShari[index];
        return ListTile(title: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/9.jpg'), fit: BoxFit.fitWidth)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
               shari.shortShari??'ddd',
               style: TextStyle(fontSize: 25, color: Colors.white),
               textAlign: TextAlign.center,
                ),
            ),
          ),
        );
    }
      ),
    );
    // ),
    // ),
    // );
  }
}
