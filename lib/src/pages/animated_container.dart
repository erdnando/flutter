import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedcontainerPage extends StatefulWidget {
  //name({Key key}) : super(key: key);

  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedcontainerPage> {

double _width= 50.0;
double _height = 50.0;
Color _color = Colors.pink;
BorderRadiusGeometry _borderRTadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('animated container'),
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.filter_center_focus),
         onPressed: (){
           final random = Random();
           setState(() {
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();
              _color = Color.fromRGBO(
                random.nextInt(255), 
                random.nextInt(255), 
                random.nextInt(255),
                1
                );
              _borderRTadius = BorderRadius.circular(random.nextInt(30).toDouble());
           });
         },
       ),
       body: Center(
         child: AnimatedContainer(
           duration: Duration(seconds: 1),
           curve: Curves.fastOutSlowIn,
           width: _width,
           height: _height,
           decoration: BoxDecoration(
             borderRadius: _borderRTadius,
             color: _color
           ),
         ),
       ),
    );
  }
}