import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/estructural/antecedente.dart';
import '../controller.dart';
import '../estructural/ciudadano.dart';

class AntecedenteSearch extends StatefulWidget {
  @override
  _AntecedenteSearchState createState() => _AntecedenteSearchState();
}

class _AntecedenteSearchState extends State<AntecedenteSearch> {
  int id = 0;
  String ciudadanoDi;
  int delitoCodigo;
  String ciudad;
  String fechaDelito;
  int sentencia;
  String estado;

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Antecedente"),
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
                        ciudadanoDi = value.trim();
                      },
                      onChanged: (value) {
                        value = ciudadanoDi;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Llene este campo";
                        }
                      },
                    ),
                    RaisedButton(
                      onPressed: _buscarAntecedente,
                      child: Text("Buscar"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Delito Codigo: "),
                      onSaved: (value) {
                        delitoCodigo = int.parse(value.trim());
                      },
                      onChanged: (value) {
                        value = delitoCodigo.toString();
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "ID antecedente: "),
                      onSaved: (value) {
                        id = int.parse(value.trim());
                      },
                      onChanged: (value) {
                        value = id.toString();
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Ciudad: "),
                      onSaved: (value) {
                        ciudad = value.trim();
                      },
                      onChanged: (value) {
                        value = ciudad;
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: "Fecha del delito: yyyy-mm-dd"),
                        onSaved: (value) {
                          fechaDelito = value.trim();
                        },
                        onChanged: (value) {
                          value = ciudadanoDi;
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Sentencia"),
                        onSaved: (value) {
                          sentencia = int.parse(value.trim());
                        },
                        onChanged: (value) {
                          value = sentencia.toString();
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Estado"),
                        onSaved: (value) {
                          estado = value.trim();
                        },
                        onChanged: (value) {
                          value = estado;
                        })
                  ],
                ),
              )
            ],
          )),
    );
  }

  void _buscarAntecedente() {
    if (globalKey.currentState.validate()) {
      globalKey.currentState.save();
      Future<Antecedente> antecedente =
          Controller.darAntecedentePorId(id);

      // ciudadanoDi = antecedente.ciudadanoDi;
      // delitoCodigo = antecedente.delitoCodigo;
      // ciudad = antecedente.ciudad;
      // fechaDelito = antecedente.fechaDelito;
      // sentencia = antecedente.sentencia;
      // estado = antecedente.estado;
    }
  }

  Future<void> _finalizado() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Se ha añadido el Antecedente Correctamente',
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
