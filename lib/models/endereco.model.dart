import 'package:fpa_projeto/models/bairro.model.dart';

class EnderecoModel{
  String endereco = "";
  String complemento = "";
  BairroModel bairro;
  String cep;

  EnderecoModel({
    this.endereco,
    this.complemento,
    this.bairro,
    this.cep,
  });

  Map<String, dynamic> toMap(){
    return{
      'endereco': endereco,
      'complemento': complemento,
      'bairro': bairro,
      'cep': cep,
    };
  }
}