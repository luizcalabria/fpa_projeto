import 'package:fpa_projeto/models/comunidade.model.dart';
import 'package:fpa_projeto/models/endereco.model.dart';
class ChamadoModel{
  int processo;
  String nomeOrigem = "";
  DateTime dataSolicitacao;
  String origemChamado = "";
  String nomeSolicitante = "";
  EnderecoModel enderecoOcorrencia;
  ComunidadeModel comunidade;
  String roteiro;
  String solicitacao;
  bool vitimas;
  bool vitimasFatais;
  String statusChamado;

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
    this.statusChamado
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
    };
  }
}