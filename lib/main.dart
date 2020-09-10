import 'package:flutter/material.dart';
import 'package:flutter_app_test/view/antecedenteAdd.dart';
import 'package:flutter_app_test/view/antecedenteDelete.dart';
import 'package:flutter_app_test/view/antecedenteList.dart';
import 'package:flutter_app_test/view/antecedenteSearch.dart';
import 'package:flutter_app_test/view/antecedenteUpdate.dart';
import 'package:flutter_app_test/view/ciudadanoSearch.dart';

import 'view/ciudadanoAdd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Antecedentes Penales',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Antecedentes Penales"),
        actions: [
          IconButton(icon: Icon(Icons.help_outline), onPressed: _creadoPor)
        ],),
      body: Center(
        child: Column(children: [
      Padding(padding: const EdgeInsets.all(20.0),
          child : Image.network("https://thumbs.gfycat.com/SlightAcrobaticCockatiel-small.gif")),
      Center(
        child: Text("Heinrich Luitpold Himmler", style: TextStyle(fontSize: 24),),
      ),
      Padding(padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text("Führereid", style: TextStyle(fontSize: 24),),
          ))
      ],)
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              child: Text("Ciudadano",style: TextStyle(fontSize: 26, color: Colors.white)),color: Colors.deepPurple,
            ),
            FlatButton(onPressed: (){_aniadirCiudadano(context);}, child: Text("Añadir Ciudadano",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _buscarCiudadano, child: Text("Buscar Ciudadano",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _actualizarCiudadano, child: Text("Actualizar Ciudadano",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _listarCiudadanos, child: Text("Listar Ciudadanos",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _eliminarCiudadano, child: Text("Eliminar Ciudadano",style: TextStyle(fontSize: 20))),
            Container(
              child: Text("Antecedente",style: TextStyle(fontSize: 26, color: Colors.white)),color: Colors.deepPurple,
            ),
            FlatButton(onPressed: _aniadirAntecedente, child: Text("Añadir Antecedente",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _buscarAntecedente, child: Text("Buscar Antecedente",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _actualizarAntecedente, child: Text("Actualizar Antecedente",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _listarAntecedentes, child: Text("Listar Antecedente",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: _eliminarAntecedente, child: Text("Eliminar Antecedente",style: TextStyle(fontSize: 20))),
            Container(
              child: Text("Otros",style: TextStyle(fontSize: 26, color: Colors.white)),color: Colors.deepPurple,
            ),
            FlatButton(onPressed: null, child: Text("Delitos",style: TextStyle(fontSize: 20))),
            FlatButton(onPressed: null, child: Text("Total sentencias",style: TextStyle(fontSize: 20)))
          ],
        ),
      ),
    );
}
  Future<void> _creadoPor()  {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Creado por:',style: TextStyle(fontSize: 26)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Esteban Sepulveda.',style: TextStyle(fontSize: 24)),
                Text('Richard Zamora.',style: TextStyle(fontSize: 24)),
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

  void _aniadirCiudadano(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return CiudadanoAdd();
    });
    Navigator.of(context).push(route);
  }

  void _buscarCiudadano() {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return CiudadanoSearch();
    });
    Navigator.of(context).push(route);
  }

  void _actualizarCiudadano() {
  }

  void _listarCiudadanos() {
  }

  void _eliminarCiudadano() {
  }

  void _aniadirAntecedente() {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return AntecedenteAdd();
    });
    Navigator.of(context).push(route);
  }

  void _buscarAntecedente() {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return AntecedenteSearch();
    });
    Navigator.of(context).push(route);
  }

  void _actualizarAntecedente() {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return AntecedenteUpdate();
    });
    Navigator.of(context).push(route);
  }

  void _listarAntecedentes() {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return AntecedenteList();
    });
    Navigator.of(context).push(route);
  }

  void _eliminarAntecedente() {
    final route = MaterialPageRoute(builder: (BuildContext context){
      return AntecedenteDelete();
    });
    Navigator.of(context).push(route);
  }
}

