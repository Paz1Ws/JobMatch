class Company {
  String numeroRuc;
  String nombreComercial;
  String desRazonSocial;
  String desDireccion;
  String ubigeo;
  String estado;
  List<String> actividadEconomica;
  List<String> sistemaEmisionElectronica;
  List<String> padrones;
  Contacto contacto;

  Company({
    required this.numeroRuc,
    required this.nombreComercial,
    required this.desRazonSocial,
    required this.desDireccion,
    required this.ubigeo,
    required this.estado,
    required this.actividadEconomica,
    required this.sistemaEmisionElectronica,
    required this.padrones,
    required this.contacto,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      numeroRuc: json['body']['numeroRuc'],
      nombreComercial: json['body']['nombreComercial'],
      desRazonSocial: json['body']['datosContribuyente']['desNomApe'],
      desDireccion: json['body']['datosContribuyente']['desDireccion'],
      ubigeo: json['body']['datosContribuyente']['ubigeo']['desDistrito'] +
          ', ' +
          json['body']['datosContribuyente']['ubigeo']['desProvincia'] +
          ', ' +
          json['body']['datosContribuyente']['ubigeo']['desDepartamento'],
      estado: json['body']['datosContribuyente']['codEstado'],
      actividadEconomica: json['body']['actividadEconomica']
          .map((dynamic e) => e.toString())
          .toList(),
      sistemaEmisionElectronica: json['body']['sistemaEmisionElectronica']
          .map((dynamic e) => e.toString())
          .toList(),
      padrones:
          json['body']['padrones'].map((dynamic e) => e.toString()).toList(),
      contacto:
          Contacto.fromJson(json['body']['datosContribuyente']['contacto']),
    );
  }
}

class Contacto {
  String numTelefono1;
  String numTelefono2;
  String numTelefono3;

  Contacto({
    required this.numTelefono1,
    required this.numTelefono2,
    required this.numTelefono3,
  });

  factory Contacto.fromJson(Map<String, dynamic> json) {
    return Contacto(
      numTelefono1: json['numTelefono1'],
      numTelefono2: json['numTelefono2'],
      numTelefono3: json['numTelefono3'],
    );
  }
}
