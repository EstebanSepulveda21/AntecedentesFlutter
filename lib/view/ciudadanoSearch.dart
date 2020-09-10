import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import '../controller.dart';
import '../estructural/ciudadano.dart';

class CiudadanoSearch extends StatefulWidget {
  @override
  _CiudadanoSearchState createState() => _CiudadanoSearchState();
}

class _CiudadanoSearchState extends State<CiudadanoSearch> {
  String cedula;
  int tipoDocumento;
  String nombre;
  String apellido;
  String fechaNacimiento;
  bool genero;

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir Ciudadano"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                key: globalKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Cedula: "),
                      onSaved: (value) {
                        cedula = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Llene este campo";
                        }
                      },
                    ),
                    RaisedButton(
                      onPressed: _buscarCiudadano,
                      child: Text("Buscar"),
                    ),
                    DropDownFormField(
                      titleText: "Tipo Documento",
                      value: tipoDocumento,
                      onSaved: (value) {
                        tipoDocumento = value;
                      },
                      onChanged: (value) {
                        setState(() {
                          tipoDocumento = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Cedula_De_Ciudadania",
                          "value": 1,
                        },
                        {
                          "display": "Tarjeta_De_identidad",
                          "value": 2,
                        },
                        {
                          "display": "Cedula_De_Extranjeria",
                          "value": 3,
                        }
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Nombre: "),
                      onSaved: (value) {
                        nombre = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Apellido: "),
                      onSaved: (value) {
                        apellido = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Fecha de nacimiento: yyyy-mm-dd"),
                      onSaved: (value) {
                        fechaNacimiento = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Genero: Solo escribir true o false"),
                      onSaved: (value) {
                        genero = true;
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  void _buscarCiudadano() {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();
      Ciudadano ciudadano = Ciudadano(
          cedula, tipoDocumento, nombre, apellido, fechaNacimiento, genero);
      Controller.darCiudadano(ciudadano.cedula);
      _finalizado();
    }
  }

  Future<void> _finalizado() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Se ha añadido el ciudadano Correctamente',
              style: TextStyle(fontSize: 26)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Muy bien.', style: TextStyle(fontSize: 24))
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
