

import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  //name({Key key}) : super(key: key);

  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem =0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener( (){
        //estamos al final de la pagina
        if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
             //  _agregar10();
             fetchData();
        }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Stack(
        children: <Widget>[
             _crearLista(),
             _crerarLoading()
        ],
      )
      
      
    );
  }


Widget _crearLista(){

  return RefreshIndicator(
    onRefresh: obtenerPag1,
      child: ListView.builder(
      controller: _scrollController,
       itemCount: _listaNumeros.length,
       itemBuilder: (BuildContext context, int index){

         final imagen = _listaNumeros[index];

           return FadeInImage(
             image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
             placeholder: AssetImage('assets/jar-loading.gif'),
           );
       },

    ),
  );

}

Future<Null> obtenerPag1() async {

  final duration = new Duration(seconds: 2);
   new Timer(duration,(){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
  });

  return Future.delayed(duration);
}

void _agregar10(){
     
     for(var i=0;i<10;i++){
          _ultimoItem++;
          _listaNumeros.add(_ultimoItem);
     }

     setState(() {});
}

Widget _crerarLoading(){
    if(_isLoading){
       return Column(
         mainAxisSize: MainAxisSize.max,
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
                CircularProgressIndicator()
             ],
           ),
           SizedBox(height: 15.0,)
         ],
       );
       } 
    else  return Container();

}

Future<Null> fetchData() async {
     _isLoading = true;
     setState(() {});

    final duration = new Duration(seconds: 2);

     new Timer(
       duration, 
       respuestaHTTP);
}

void respuestaHTTP(){


  _isLoading = false;

  _scrollController.animateTo(
    _scrollController.position.pixels + 100,
    curve: Curves.fastOutSlowIn,
    duration: Duration(milliseconds: 250)
  );



  _agregar10();
}


}