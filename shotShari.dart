import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:naturalwallpaper/repositery.dart';
import 'full_page_shari.dart';
import 'model_class.dart';

class ShortShari extends StatefulWidget {
  const ShortShari({Key? key}) : super(key: key);

  @override
  _ShortShariState createState() => _ShortShariState();
}

class _ShortShariState extends State<ShortShari> {
  @override
  late List<ModelClassShari>modelClassShari;
  var repositery = ShariRepositery();
  void initState(){
    super.initState();
    _shortShari();
  }

  _shortShari()async{
    var shari = await repositery.getShortShari();
    setState(() {
     modelClassShari = shari;
    });
  }

  Widget build(BuildContext context) {
    final key  = new GlobalKey<ScaffoldState>();
    return DefaultTabController(length: 2, child: Scaffold(
      key: key,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: AppBar(
            title: Center(
              child: Text(
                ' SHORT SHARI',
              ),
            ),
            flexibleSpace: Image(
              image: AssetImage('image/4.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),

      body: Container(decoration: BoxDecoration(image: DecorationImage
        (image:AssetImage('image/24.jpg'),fit: BoxFit.fill )),
        child: ListView.builder(itemCount:null == modelClassShari ? 0
            : modelClassShari.length,
          itemBuilder: (BuildContext context, int index)
          {
            ModelClassShari  shari = modelClassShari[index];
            return  Card(child: ListTile(
              trailing:IconButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(
                    text: shari.shortShari,
                  ));
                  key.currentState!.showSnackBar(new SnackBar(
                      content: new Text(
                        "copid",
                      )));
                },
                icon: Icon(Icons.copy),
                // autofocus: true,
                alignment: Alignment.bottomLeft,
              ),
              title: Container(
                // height: 170,
                child: ListTile(
                  leading: Container(

                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          shari.shortShari,textAlign: TextAlign.start
                        )
                      ],totalRepeatCount: 1,
                      isRepeatingAnimation: false,

                      // boxBackgroundColor: Colors.red
                    ),
                  ),
                ),
              ),
            ),
            );
          } ,),
      )
    ));
  }
}
