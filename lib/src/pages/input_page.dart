import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  //name({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada='Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();
  List<String> _poderes= ['Volar','Rayos X', 'Super aliento', 'Super fuerza'];

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
            _createEmail(),
            Divider(),
             _createPassword(),
             Divider(),
             _createFecha(context),
             Divider(),
             _createCropDown(),
            Divider(),
            _crearPersona(),
        ],
      ),
    );
  }
             
             
//Methodos----------------------------------------------------------------                           
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
        
        Widget _createFecha(BuildContext context) {

          return TextField(
           controller: _inputFieldDateController,
           enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                      ),
                    hintText: 'Fecha de nacimiento',
                    labelText: 'Fecha de nacimiento',
                    helperText: 'Solo es el nombre',
                    suffixIcon: Icon(Icons.perm_contact_calendar),
                    icon: Icon(Icons.calendar_today)
                  ),
                  onTap: (){

                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectDate(context);
                    setState(() {
                      
                    });
                  },
                ); 


        }

        _selectDate(BuildContext contenxt) async{
          DateTime picked = await showDatePicker(
            context: contenxt,
            initialDate: new DateTime.now(),
            firstDate: new DateTime(2018),
            lastDate: new DateTime(2025),
            locale: Locale('es', 'ES')
          );

          if(picked !=null){
              setState(() {
                _fecha = picked.toString();
                _inputFieldDateController.text = _fecha;
              });
          }
        }

        List<DropdownMenuItem<String>> getOPcionesdropDown(){

            List<DropdownMenuItem<String>> lista = new List();

            _poderes.forEach( (poder){
                 lista.add(DropdownMenuItem(
                   child: Text(poder),
                   value: poder,
                   ));
            });

            return lista;
        }

        Widget _createCropDown(){

          return Row(
            children: <Widget>[
                  Icon(Icons.select_all),
                  SizedBox(width: 30.0,),
                  Expanded(
                    flex: 25,
                    child: DropdownButton(
                    value: _opcionSeleccionada,
                    items: getOPcionesdropDown(),
                    onChanged: (opt){
                      print(opt);
                      setState(() {
                        _opcionSeleccionada = opt;
                      });
                    },
                    ),
                  )
            ],
          );
          
          
        
        }

        Widget _crearPersona() {

            return ListTile(
              title: Text('Nombre es: $_nombre'),
              subtitle: Text('Email: $_email'),
              trailing: Text('$_opcionSeleccionada'),
            );
          }
        
        Widget _createEmail() {

          return TextField(
            keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                      ),
                    hintText: 'Email',
                    labelText: 'Email',
                    helperText: 'Solo es el nombre',
                    suffixIcon: Icon(Icons.alternate_email),
                    icon: Icon(Icons.email)
                  ),
                  onChanged: (valor){
                    setState(() {
                        _email = valor;
                    });
                  },
                ); 

        }

        Widget _createPassword() {

          return TextField(
           obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                      ),
                    hintText: 'Password',
                    labelText: 'Password',
                    helperText: 'Solo es el nombre',
                    suffixIcon: Icon(Icons.lock_open),
                    icon: Icon(Icons.lock)
                  ),
                  onChanged: (valor){
                    setState(() {
                        _password = valor;
                    });
                  },
                ); 


        }



}