import 'package:fpa_projeto/models/comunidade.model.dart';
class ChamadoModel{
  int processo;
  String nomeOrigem = "";
  String dataSolicitacao;
  String origemChamado = "";
  String nomeSolicitante = "";
  String logradouro = "";
  String numero = "";
  String complemento = "";
  int bairro = 0;
  ComunidadeModel comunidade;
  String roteiro = "";
  String solicitacao = "";
  bool vitimas = false;
  bool vitimasFatais = false;
  String statusChamado = "";
  double latitude = 0.0;
  double longitude = 0.0;

  ChamadoModel({
    this.processo,
    this.nomeOrigem,
    this.dataSolicitacao,
    this.origemChamado,
    this.nomeSolicitante,
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.comunidade,
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
      'bairro': bairro,
      'comunidade': comunidade,
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
      bairro: 'bairro',
      comunidade: 'comunidade',
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