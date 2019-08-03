import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  //name({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  String _nombre = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        children: <Widget>[
          _crerarInput(),
          Divider(),
          _crearPersona(),
                            ],
                          ),
                        );
                      }
                    
              Widget _crerarInput() {
          
                  return TextField(
                    autofocus: true,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20.0)
                       ),
                      counter: Text('Letras ${_nombre.length}'),
                      hintText: 'Nombre de la persona',
                      labelText: 'Nombre',
                      helperText: 'Solo es el nombre',
                      suffixIcon: Icon(Icons.accessibility),
                      icon: Icon(Icons.account_circle)
                    ),
                    onChanged: (valor){
                      setState(() {
                         _nombre = valor;
                      });
                    },
                  );
          
              }
          
           Widget _crearPersona() {

             return ListTile(
               title: Text('Nombre es $_nombre'),
             );
           }



}