import 'dart:convert';

class Antecedente{
  int id;
  String ciudadanoDi;
  int delitoCodigo;
  String ciudad;
  String fechaDelito;
  int sentencia;
  String estado;

  Antecedente(this.id, this.ciudadanoDi, this.delitoCodigo, this.ciudad,
      this.fechaDelito, this.sentencia, this.estado);

  factory Antecedente.fromJson(Map<String, dynamic> data) {
    return Antecedente(
        data['id'],
        data['ciudadanoDi'],
        data['delitoCodigo'],
        data['ciudad'],
        data['fechaDelito'],
        data['sentencia'],
        data['estado']
    );
  }
  factory Antecedente.fromMap(Map<String, dynamic> json) {
    return Antecedente(
        json['id'],
        json['ciudadanoDi'],
        json['delitoCodigo'],
        json['ciudad'],
        json['fechaDelito'],
        json['sentencia'],
        json['estado']
    );
  }
  static Antecedente parseProduct(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return Antecedente.fromJson(parsed);
  }

  static List<Antecedente> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Antecedente>((json) =>Antecedente.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'ciudadanoDi':ciudadanoDi,
      'delitoCodigo':delitoCodigo,
      'ciudad':ciudad,
      'fechaDelito':fechaDelito,
      'sentencia':sentencia,
      'estado':estado
    };
  }

}