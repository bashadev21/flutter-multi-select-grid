import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  final MyCon  con=Get.put(MyCon());
  bool valuefirst = false;  
  bool valuesecond = false;  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: GridView.builder(
        itemCount: gridList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, i) {
           
            final card= gridList[i];
            return Stack(
              children: [
                Card(
                  elevation: 10,
                  child: Center(child: Text(card.name))),
               Obx(()=>Checkbox(  
                      checkColor: Colors.white,  
                      activeColor: Colors.red,  
                      value: card.isSelected.value,  
                      onChanged: (bool? value) {  
                        if( card.isSelected.value==true){
                          con.seletedList.add(card.id);
                        }else{
                           con.seletedList.add(card.id);

                        }

                      
                          card.isSelected.value = value!;  
                        
                      },  
                    ), )    

              ],
            );
          }),
      floatingActionButton: FloatingActionButton( 
        onPressed: (){
          // setState(() {
          //     gridList..shuffle();
            
          // });
         
          print(con.seletedList..sort());
          print(con.seletedList..shuffle());
          Get.defaultDialog(title: 'Selected value',middleText:'${con.seletedList..sort()}' );
         
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class MyCon extends GetxController{
  
  var seletedList=<int>[].obs;
}