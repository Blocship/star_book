import 'package:flutter/material.dart';

class _MyAppState extends State<MyApp> {

  String label='';
  double _value=1.0;
  List<String> modes=['Routine','Happy','sad','angry','normal'];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
                        title:Text('Mode Indicator!',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),
                        leading: Icon(Icons.child_care,color: Colors.white,size:60 ,),
                        centerTitle: true,

                        primary: true,
                        ),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          color: Colors.blue[100],
          child:  Column(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                height: 100,
              ),
             Container(
                color: Colors.transparent,
                height: 30,
                child: Text('How was your day today?',style: TextStyle(fontSize: 25,color: Colors.white)),
              ),
              Container(
                color: Colors.transparent,
                height: 20,
              ),
              Container(
                color: Colors.transparent,
                height: 125,
                child:  (_value ==1)?Icon(Icons.child_care,size: 130,color: Colors.red[200],):(_value ==2)?Icon(Icons.child_care,size: 130,color: Colors.green[200],):(_value ==3)?Icon(Icons.child_care,size: 130,color: Colors.green[500],):(_value ==4)?Icon(Icons.child_care,size: 130,color: Colors.orange[300],):Icon(Icons.child_care,size: 130,color: Colors.white,),
              ),
              Container(
                color: Colors.transparent,
                height: 20,
              ),
              Container(
                color: Colors.transparent,
                height: 100,
                child:Slider(
                   min: 0,
                   max: 4,
                   value: _value,
                  onChanged: (value) {
                   setState(() {
                      _value = value;
                         });
                            },
                            divisions: 4,
                            label: (_value ==1)?"sad":(_value ==2)?"average":(_value ==3)?"happy":(_value ==4)?"productive":null,
                     ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}
