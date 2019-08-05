

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  //name({Key key}) : super(key: key);

  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
    );
  }
}