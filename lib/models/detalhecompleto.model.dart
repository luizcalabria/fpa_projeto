import 'package:intl/intl.dart';

class DetalheCompletoModel{
  int processo;
  String nomeOrigem = "";
  String dataSolicitacao;
  String origemChamado = "";
  String nomeSolicitante = "";
  String logradouro = "";
  String numero = "";
  String complemento = "";
  int codigoBairro = 0;
  String nomeBairro = "";
  int rpa = 0;
  String mr = "";
  String regional = "";
  String roteiro = "";
  String solicitacao = "";
  bool vitimas = false;
  bool vitimasFatais = false;
  String statusChamado = "";
  double latitude = 0.0;
  double longitude = 0.0;

  DetalheCompletoModel({
    this.processo,
    this.nomeOrigem,
    this.dataSolicitacao,
    this.origemChamado,
    this.nomeSolicitante,
    this.logradouro,
    this.numero,
    this.complemento,
    this.codigoBairro,
    this.nomeBairro,
    this.rpa,
    this.mr,
    this.regional,
    this.roteiro,
    this.solicitacao,
    this.vitimas,
    this.vitimasFatais,
    this.statusChamado,
    this.latitude,
    this.longitude
  });

  Map<String, dynamic> toMap() {
    return {
      'processo': processo,
      'nomeOrigem': nomeOrigem,
      'dataSolicitacao': dataSolicitacao,
      'origemChamado': origemChamado,
      'nomeSolicitante': nomeSolicitante,
      'logradouro': logradouro,
      'numero': numero,
      'complemento': complemento,
      'codigoBairro': codigoBairro,
      'nomeBairro': nomeBairro,
      'rpa': rpa,
      'mr': mr,
      'regional': regional,
      'roteiro': roteiro,
      'solicitacao': solicitacao,
      'vitimas': vitimas,
      'vitimasFatais': vitimasFatais,
      'statusChamado': statusChamado,
      'latitude': latitude,
      'longitude': longitude
    };
  }
  Map<dynamic, String> fromMap() {
    return {
      processo: 'processo',
      nomeOrigem: 'nomeOrigem',
      dataSolicitacao: 'dataSolicitacao',
      origemChamado: 'origemChamado',
      nomeSolicitante: 'nomeSolicitante',
      logradouro: 'logradouro',
      numero: 'numero',
      complemento: 'complemento',
      codigoBairro: 'codigoBairro',
      nomeBairro: 'nomeBairro',
      rpa: 'rpa',
      mr: 'mr',
      regional: 'regional',
      roteiro: 'roteiro',
      solicitacao: 'solicitacao',
      vitimas: 'vitimas',
      vitimasFatais: 'vitimasFatais',
      statusChamado: 'statusChamado',
      latitude: 'latitude',
      longitude: 'longitude'
    };
  }
}