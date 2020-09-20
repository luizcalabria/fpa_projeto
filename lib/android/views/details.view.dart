import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/loading.view.dart';
import 'package:fpa_projeto/models/bairro.model.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/models/detalheCompleto.model.dart';
import 'package:fpa_projeto/repositories/bairro.repository.dart';
import 'package:fpa_projeto/repositories/chamado.repository.dart';
class DetailsView extends StatefulWidget {
  final int id;

  DetailsView({@required this.id});

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final repChamado = new ChamadoRepository();
  final repBairro = new BairroRepository();

  buscarChamado(int processo) async{
    DetalheCompletoModel dc = new DetalheCompletoModel();
    await repChamado.buscarChamado(processo).then((ChamadoModel chamado) {
      dc.processo = chamado.processo;
      dc.nomeOrigem = chamado.nomeOrigem;
      dc.dataSolicitacao = chamado.dataSolicitacao;
      dc.origemChamado = chamado.origemChamado;
      dc.nomeSolicitante = chamado.nomeSolicitante;
      dc.logradouro = chamado.logradouro;
      dc.numero = chamado.numero;
      dc.complemento = chamado.complemento;
      dc.codigoBairro = chamado.bairro;
      dc.roteiro = chamado.roteiro;
      dc.solicitacao = chamado.solicitacao;
      dc.vitimas = chamado.vitimas;
      dc.vitimasFatais = chamado.vitimasFatais;
      dc.statusChamado = chamado.statusChamado;
      dc.latitude = chamado.latitude;
      dc.longitude = chamado.longitude;
    }).catchError((erro){
      print(erro);
    });
    await repBairro.buscarPorCodigo(dc.codigoBairro).then((BairroModel bairros){
      dc.nomeBairro = bairros.nomeBairro;
      dc.rpa = bairros.rpa;
      dc.mr = bairros.mr;
      dc.regional = bairros.regional;
      return dc;
    });
    return dc;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: buscarChamado(widget.id),

      builder: (ctx, snp) {
        if (snp.hasData) {
          DetalheCompletoModel chamado = snp.data;
          String v;
          String vf;
          if (chamado.vitimas == 0){
            v = "Não";
          } else{
            v = "Sim";
          }
          if (chamado.vitimasFatais == 0){
            vf = "Não";
          } else{
            vf = "Sim";
          }
          return page(context, chamado, v, vf);
        } else {
          return LoadingView();
        }
      },
    );
  }
  Widget page(BuildContext context,DetalheCompletoModel chamado, String v, String vf) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          color: Theme.of(context).primaryColor,
          child: Row(
            children: <Widget>[
              SizedBox(
                height: 28,
                width: 28,
                child: Image.asset("assets/images/defesa_civil.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                  "Abertura de Chamado"
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              Container (
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        initialValue: chamado.nomeOrigem,
                        decoration: InputDecoration(
                          labelText: "Usuário de Origem",
                        ),
                        readOnly: true,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Flexible(
                      child: TextFormField(
                        initialValue: chamado.dataSolicitacao,
                        decoration: InputDecoration(
                            labelText: "Data de Abertura"
                        ),
                        readOnly: true,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextFormField(
                initialValue: chamado.origemChamado,
                decoration: InputDecoration(
                    labelText: "Origem do Chamado"
                ),
                readOnly: true,
              ),
              TextFormField(
                initialValue: chamado.nomeSolicitante,
                decoration: InputDecoration(
                    labelText: "Nome do Solicitante"
                ),
                readOnly: true,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "Dados da Solicitação"
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    labelText: "Roteiro de Acesso"
                ),
                initialValue: chamado.roteiro,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                    labelText: "Logradouro"
                ),
                initialValue: chamado.logradouro,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Número"
                      ),
                      initialValue: chamado.numero,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Complemento"
                      ),
                      initialValue: chamado.complemento,
                    ),
                  )
                ],
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Bairro"
                ),
                initialValue: chamado.nomeBairro,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "RPA"
                      ),
                      initialValue: chamado.rpa.toString(),
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Micro"
                      ),
                      initialValue: chamado.mr,
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Regional"
                      ),
                      initialValue: chamado.regional,
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Solicitação"
                ),
                initialValue: chamado.solicitacao,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Vítimas"
                      ),
                      initialValue: v,
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Flexible(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Vítimas Fatais"
                      ),
                      initialValue: vf,
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
