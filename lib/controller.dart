import 'estructural/antecedente.dart';
import 'estructural/ciudadano.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Controller{
  static final  String urlGeneral = "http://192.168.16.13:7101/ServidorAntecedentesJDBCSW-ServidorAntecedentesSW-context-root/resources/model/";
//----------------------------------------- CIUDADANO -----------------------------------------
  static Future<bool> eliminarCiudadano(String cedula) async {
    final response = await http.delete(urlGeneral + 'eliminarCiudadano?cedula=$cedula');
    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'true';
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future<bool> agregarCiudadano(Ciudadano ciudadano) async {
    String body = json.encode(ciudadano.toJson());
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(urlGeneral + 'agregarCiudadano', headers: headers,body: body);
    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'true';
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future<Ciudadano> darCiudadano(String cedula) async {
    final response = await http.get(urlGeneral + 'darCiudadano?cedula=$cedula');
    if (response.statusCode == 200) {
      return Ciudadano.parseProduct(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future<List<Ciudadano>> darCiudadanos() async {
    final response = await http.get(urlGeneral + 'darCiudadanos');
    if (response.statusCode == 200) {

      return Ciudadano.parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
  /*
      Map<String, String> headers={'cedula':'2'};
      final response = await http.delete('http://192.168.16.13:7101/ServidorAntecedentesJDBCSW-ServidorAntecedentesSW-context-root/resources/model/eliminarCiudadano?cedula=2', headers: headers);

   */
//----------------------------------------- ANTECEDENTE -----------------------------------------
  static Future<bool> eliminarAntecedente(int id) async {
    Map<String, String> headers={'cedula':'$id'};
    final response = await http.delete(urlGeneral + 'eliminarAntecedente?id=$id', headers: headers);
    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'true';
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future<bool> agregarAntecedente(Antecedente antecedente) async {
    String body = json.encode(antecedente.toJson());
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(urlGeneral + 'AgregarAntecedente', headers: headers,body: body);
    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'true';
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future<bool> actualizarAntecedente(Antecedente antecedente) async {
    String body = json.encode(antecedente.toJson());
    final headers = {'Content-Type': 'application/json'};
    final response = await http.put(urlGeneral + 'actualizarAntecedente', headers: headers,body: body);
    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'true';
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future<Antecedente> darAntecedentePorId(int id) async {
    final headers = {'id':'$id'};
    final response = await http.get(urlGeneral + 'darAntecedente?id=$id');

    if (response.statusCode == 200) {
      return Antecedente.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Antecedente>> darAntecedentes() async {
    final response = await http.get(urlGeneral + 'darAntecedentes');
    if (response.statusCode == 200) {

      return Antecedente.parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}