import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  //const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
              _cardTipo1(),
            SizedBox(height: 30),
            _cardTipo2(),
             SizedBox(height: 30),
          ],
        ),
    );
  }
                        
   Widget  _cardTipo1() {
        return Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)) ,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_album,color: Colors.blue,),
                title: Text('Titulo d ela tarjeta'),
                subtitle: Text('Detalle d ela tarjeta que puede contener muchos datos para q se aprecien'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    FlatButton(
                      child: Text('Cancelar'),
                      onPressed: (){},
                    ),
                      FlatButton(
                      child: Text('OK'),
                      onPressed: (){},
                    )
              ],)
            ],
          ),
        );
      }
  
   Widget _cardTipo2() {

    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
             image: NetworkImage('https://www.tom-archer.com/wp-content/uploads/2018/06/milford-sound-night-fine-art-photography-new-zealand.jpg'),
             placeholder: AssetImage('assets/jar-loading.gif'),
             fadeInDuration: Duration(milliseconds: 200),
             height: 300.0,
             fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner'))
        ],
      ),
    );

  return Container(
    child: ClipRRect(
      child: card,
      borderRadius: BorderRadius.circular(14.0),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        spreadRadius: 2.0,
        offset: Offset(2.0,10.0)
        )
      ]
    ),
  );

  }




}