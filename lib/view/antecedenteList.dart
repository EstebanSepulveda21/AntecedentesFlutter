import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/estructural/antecedente.dart';
import '../controller.dart';
import '../estructural/ciudadano.dart';

class AntecedenteList extends StatefulWidget {
  @override
  _AntecedenteListState createState() => _AntecedenteListState();
}

class _AntecedenteListState extends State<AntecedenteList> {
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
        title: Text("Lista Antecedentes"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Form(
                key: globalKey,
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: _listAntecedente,
                      child: Text("Listar"),
                    ),
                    GridView.count(crossAxisCount: 2,
                      children: List.generate(20, (index) {
                        return Center(
                          child: Text(
                            'Item $index',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  void _listAntecedente() {
      Future<List<Antecedente>> antecedentes =Controller.darAntecedentes();
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
