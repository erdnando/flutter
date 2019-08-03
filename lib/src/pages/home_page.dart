import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';


class HomePage extends  StatelessWidget {
  //const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
          );
        }
      
    Widget _lista() {

      return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: ( context, AsyncSnapshot<List<dynamic>> snapshot) {
         
          return ListView(
            children: _listaItems(snapshot.data,context),
          );
          
        },
      );

  
    }
        
   List<Widget> _listaItems(List<dynamic> data, BuildContext context) {

      final List<Widget> opciones = [];

      data.forEach( (opt){

        final widgetAux = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
          onTap: (){
           /*  final route = MaterialPageRoute(
                 builder: ( context)=> AlertPage()
            );
            Navigator.push(context, route); */

            Navigator.pushNamed(context, opt['ruta']);




          },
        );

        opciones..add(widgetAux)
                ..add(Divider());
      });

      return opciones;
    }


}