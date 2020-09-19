import 'package:fpa_projeto/models/comunidade.model.dart';
import 'package:fpa_projeto/models/endereco.model.dart';
class ChamadoModel{
  int processo;
  String nomeOrigem = "";
  String dataSolicitacao;
  String origemChamado = "";
  String nomeSolicitante = "";
  EnderecoModel enderecoOcorrencia;
  ComunidadeModel comunidade;
  String roteiro;
  String solicitacao;
  bool vitimas;
  bool vitimasFatais;
  String statusChamado;
  double latitude;
  double longitude;

  ChamadoModel({
    this.processo,
    this.nomeOrigem,
    this.dataSolicitacao,
    this.origemChamado,
    this.nomeSolicitante,
    this.enderecoOcorrencia,
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
      'enderecoOcorrencia': enderecoOcorrencia,
      'comunidade': comunidade,
      'roteiro': roteiro,
      'solicitacao': solicitacao,
      'vitimas': vitimas,
      'vitimasFatais': vitimasFatais,
      'statusChamado': statusChamado,
      'latitude': latitude,
      'logitude': longitude
    };
  }
  Map<dynamic, String> fromMap() {
    return {
      processo: 'processo',
      nomeOrigem: 'nomeOrigem',
      dataSolicitacao: 'dataSolicitacao',
      origemChamado: 'origemChamado',
      nomeSolicitante: 'nomeSolicitante',
      enderecoOcorrencia: 'enderecoOcorrencia',
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