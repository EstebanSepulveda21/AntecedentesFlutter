import 'dart:convert';

class Ciudadano{
  String cedula;
  int tipoDocumento;
  String nombre;
  String apellido;
  String fechaNacimiento;
  bool genero;

  Ciudadano(this.cedula, this.tipoDocumento, this.nombre, this.apellido,
      this.fechaNacimiento, this.genero);

  factory Ciudadano.fromJson(Map<String, dynamic> data) {
    return Ciudadano(
      data['cedula'],
      data['tipoDocumento'],
      data['nombre'],
      data['apellido'],
      data['fechaNacimiento'],
      data['genero']
    );
  }
  factory Ciudadano.fromMap(Map<String, dynamic> json) {
    return Ciudadano(
      json['cedula'],
      json['tipoDocumento'],
      json['nombre'],
      json['apellido'],
      json['fechaNacimiento'],
      json['genero']
    );
  }
  static Ciudadano parseProduct(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return Ciudadano.fromJson(parsed);
  }

  static List<Ciudadano> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Ciudadano>((json) =>Ciudadano.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'cedula': cedula,
      'tipoDocumento': tipoDocumento,
      'nombre': nombre,
      'apellido': apellido,
      'fechaNacimiento': fechaNacimiento,
      'genero': genero,
    };
  }

  String toJsonText(){
    return '{"cedula": "$cedula","tipoDocumento": $tipoDocumento,"nombre": "$nombre","apellido": "$apellido","fechaNacimiento": "$fechaNacimiento","genero": $genero}';
  }
}