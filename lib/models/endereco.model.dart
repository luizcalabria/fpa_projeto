import 'package:fpa_projeto/models/bairro.model.dart';

class EnderecoModel{
  String logradouro = "";
  String numero = "";
  String complemento = "";
  BairroModel bairro;
  String cep;

  EnderecoModel({
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.cep,
  });

  Map<String, dynamic> toMap(){
    return{
      'logradouro': logradouro,
      'numero': numero,
      'complemento': complemento,
      'bairro': bairro,
      'cep': cep,
    };
  }
}