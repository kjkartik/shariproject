import 'package:flutter/material.dart';
import 'package:naturalwallpaper/full_page_shari.dart';
import 'package:naturalwallpaper/model_class.dart';
import 'package:naturalwallpaper/repositery.dart';

class LongShari extends StatefulWidget {
  const LongShari({Key? key}) : super(key: key);

  @override
  _LongShariState createState() => _LongShariState();
}

class _LongShariState extends State<LongShari> {
  @override
  late List<ModelClassShari>modelClassShari;
  var repositery =ShariRepositery();
  void initState(){
    super.initState();
    _loadData();
  }
   _loadData()async{
    var list =await repositery.getLongShari();
    setState(() {
      modelClassShari =list;
    });

   }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0),
        child: AppBar(
          title: Center(
            child: Text(
              'LONG SHARI',
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('image/8.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      body: Container(decoration: BoxDecoration(image: DecorationImage
        (image:AssetImage('image/18.jpg'),fit: BoxFit.fill )),
        child: ListView.builder
        (itemCount: null == modelClassShari ? 0 : modelClassShari.length,
        itemBuilder: (BuildContext context, int index) {
          ModelClassShari modelclass = modelClassShari[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(),
                backgroundColor: Colors.white,
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FullPage()),
                );
                },
                child: Container(decoration: BoxDecoration(image: DecorationImage
          (image:AssetImage('image/9.jpg'),fit: BoxFit.fill)),
                  child: Text(
          // (image:AssetImage('image/18.jpg'),fit: BoxFit.fill)
                    modelclass.shortShari,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                    // maxLines: 6,
                  ),
                ),
              ),
            ),
          );
        },),),
    );
  }
}
