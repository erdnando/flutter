
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  //name({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

double _valorSlider = 100.0;
bool _flagCheckBox = true;
bool _flagSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearimagen())
          ],
        ),
      ),
    );
  }
            
  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen: $_valorSlider',
      divisions: 5,
      value: _valorSlider,
      min: 10.0,
      max: 300.0,
      onChanged: _flagCheckBox ? null :  (valor){
          print(valor);
          setState(() {
            _valorSlider = valor;
          });
      },
      );
  }

  Widget _crearimagen() {

    return Image(
     image: NetworkImage('http://pngimg.com/uploads/slender_man/slender_man_PNG7.png'),
     width: _valorSlider,
     fit: BoxFit.contain,
      );
  }

  Widget _crearCheckBox(){
    return CheckboxListTile(
      title: Text('Bloquear slider', textAlign: TextAlign.end,),
      subtitle: Text('Control slider', textAlign: TextAlign.end,),
        value: _flagCheckBox,
        onChanged:(valor){
          setState(() {
              _flagCheckBox = valor;
            });
        },
      );
  }

   Widget _crearSwitch(){
    return SwitchListTile(
      title: Text('Bloquear slider', textAlign: TextAlign.end,),
      subtitle: Text('Control slider', textAlign: TextAlign.end,),
        value: _flagCheckBox,
        onChanged:(valor){
          setState(() {
              _flagCheckBox = valor;
            });
        },
      );
  }





}