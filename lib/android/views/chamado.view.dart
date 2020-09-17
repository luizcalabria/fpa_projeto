import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/home.view.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/repositories/chamado.repository.dart';
import 'package:fpa_projeto/globals.dart';
import 'package:intl/intl.dart';

class ChamadoView extends StatefulWidget {
  final ChamadoModel chamado;
  ChamadoView({this.chamado});

  @override
  _ChamadoViewState createState() => _ChamadoViewState();
}

class _ChamadoViewState extends State<ChamadoView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repChamado = ChamadoRepository();
  String dropdownValue ;

  onSubmit(){
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    insert();
  }

  insert(){
    _repChamado.insertChamado(widget.chamado).then((_) {
      onSuccess();
    }).catchError((_){
      onError();
    });
  }

  onSuccess(){
    var push = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError(){
    final snackBar = SnackBar(
      content: Text("Deu Erro"),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    agora = DateFormat('dd/MM/yyyy – kk:mm:ss').format(DateTime.now());
    widget.chamado.dataSolicitacao = agora;
    return Scaffold(
      key: _scaffoldKey,
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
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container (
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.35,
                      child: TextFormField(
                        initialValue: widget.chamado.nomeOrigem,
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
                        initialValue: widget.chamado.dataSolicitacao,
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
                initialValue: widget.chamado.origemChamado,
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
                initialValue: widget.chamado.nomeSolicitante,
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
                decoration: InputDecoration(
                  labelText: "Roteiro"
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Roteiro inválido';
                  }
                  return null;
                },
                onChanged: (val){
                  widget.chamado.roteiro = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: onSubmit,
                  icon: Icon(
                    Icons.save,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
