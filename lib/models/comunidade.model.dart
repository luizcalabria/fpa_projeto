import 'package:fpa_projeto/models/bairro.model.dart';

class ComunidadeModel{
  int id;
  String nomeComunidade;
  BairroModel bairroComunidade;

  ComunidadeModel({
    this.id,
    this.nomeComunidade,
    this.bairroComunidade
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'nomeComunidade': nomeComunidade,
      'bairroComunidade': bairroComunidade
    };
  }
}