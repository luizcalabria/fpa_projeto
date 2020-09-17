import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/loading.view.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/repositories/chamado.repository.dart';
class DetailsView extends StatefulWidget {
  final int id;

  DetailsView({@required this.id});

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final repChamado = new ChamadoRepository();

  BuscarChamado(int processo) async{
    ChamadoModel chamado = await repChamado.buscarChamado(processo) as ChamadoModel;
    return chamado;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repChamado.buscarChamado(widget.id),
      builder: (ctx, snp) {
        if (snp.hasData) {
          ChamadoModel contact = snp.data;
          return page(context, contact);
        } else {
          return LoadingView();
        }
      },
    );
  }
  Widget page(BuildContext context,ChamadoModel chamado) {

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
                  "Situação do Chamado"
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
                    Container(
                        width: MediaQuery.of(context).size.width*0.35,
                        child: TextFormField(
                          initialValue: chamado.nomeOrigem,
                          decoration: InputDecoration(
                              labelText: "Usuário de Origem"
                          ),
                          readOnly: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Usuário de Origem inválido';
                            }
                            return null;
                          },
                        )
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width*0.42,
                        child: TextFormField(
                          initialValue: chamado.dataSolicitacao,
                          decoration: InputDecoration(
                              labelText: "Data de Abertura"
                          ),
                          readOnly: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Data de Abertura inválida';
                            }
                            return null;
                          },
                        )
                    ),
                  ],
                ),
              ),
              TextFormField(
                initialValue: chamado.origemChamado,
                decoration: InputDecoration(
                    labelText: "Origem do Chamado"
                ),
                readOnly: true,
                validator: (value){
                  if (value.isEmpty) {
                    return 'Data de Abertura inválida';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: chamado.nomeSolicitante,
                decoration: InputDecoration(
                    labelText: "Nome do Solicitante"
                ),
                readOnly: true,
                validator: (value){
                  if (value.isEmpty) {
                    return 'Data de Abertura inválida';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "Dados da Solicitação"
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                initialValue: chamado.roteiro,
                readOnly: true,
                decoration: InputDecoration(
                    labelText: "Roteiro"
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Roteiro inválido';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
