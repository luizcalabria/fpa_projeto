import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/home.view.dart';
import 'package:fpa_projeto/models/bairro.model.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/repositories/bairro.repository.dart';
import 'package:fpa_projeto/repositories/chamado.repository.dart';
import 'package:fpa_projeto/globals.dart';
import 'package:intl/intl.dart';

class ChamadoView extends StatefulWidget {
  final ChamadoModel chamado;
  BairroModel bairro;
  ChamadoView({
    this.chamado,
    this.bairro
  });

  @override
  _ChamadoViewState createState() => _ChamadoViewState();
}

class _ChamadoViewState extends State<ChamadoView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repChamado = ChamadoRepository();
  final _repBairro = BairroRepository();
  String dropdownValue ;
  TextEditingController _controllerRpa = TextEditingController(text: "");
  TextEditingController _controllerMr = TextEditingController(text: "");
  TextEditingController _controllerRegional = TextEditingController(text: "");
  var isSelectedVitima = false;
  var isSelectedVitimaFatal = false;

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
    Navigator.push(
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
    String agora = DateFormat('dd/MM/yyyy – kk:mm:ss').format(DateTime.now());
    final List<String> bairros = ['AFLITOS',
      'AFOGADOS',
      'AGUA FRIA',
      'ALTO DO MANDU',
      'ALTO JOSE BONIFACIO',
      'ALTO JOSE DO PINHO',
      'ALTO SANTA TEREZINHA',
      'APIPUCOS',
      'AREIAS',
      'ARRUDA',
      'BARRO',
      'BEBERIBE',
      'BOA VIAGEM',
      'BOA VISTA',
      'BOMBA DO HEMETERIO',
      'BONGI',
      'BRASILIA TEIMOSA',
      'BREJO DA GUABIRABA',
      'BREJO DE BEBERIBE',
      'CABANGA',
      'CACOTE',
      'CAJUEIRO',
      'CAMPINA DO BARRETO',
      'CAMPO GRANDE',
      'CASA AMARELA',
      'CASA FORTE',
      'CAXANGA',
      'CIDADE UNIVERSITARIA',
      'COELHOS',
      'COHAB',
      'COQUEIRAL',
      'CORDEIRO',
      'CORREGO DO JENIPAPO',
      'CURADO',
      'DERBY',
      'DOIS IRMAOS',
      'DOIS UNIDOS',
      'ENCRUZILHADA',
      'ENGENHO DO MEIO',
      'ESPINHEIRO',
      'ESTANCIA',
      'FUNDAO',
      'GRACAS',
      'GUABIRABA',
      'HIPODROMO',
      'IBURA',
      'ILHA DO LEITE',
      'ILHA DO RETIRO',
      'ILHA JOANA BEZERRA',
      'IMBIRIBEIRA',
      'IPSEP',
      'IPUTINGA',
      'JAQUEIRA',
      'JARDIM SAO PAULO',
      'JIQUIA',
      'JORDAO',
      'LINHA DO TIRO',
      'MACAXEIRA',
      'MADALENA',
      'MANGABEIRA',
      'MANGUEIRA',
      'MARANGUAPE',
      'MONTEIRO',
      'MORRO DA CONCEICAO',
      'MUSTARDINHA',
      'NOVA DESCOBERTA',
      'PAISSANDU',
      'PARNAMIRIM',
      'PASSARINHO',
      'PAU FERRO',
      'PEIXINHOS',
      'PINA',
      'POCO',
      'PONTO DE PARADA',
      'PORTO DA MADEIRA',
      'PRADO',
      'RECIFE',
      'ROSARINHO',
      'SAN MARTIN',
      'SANCHO',
      'SANTANA',
      'SANTO AMARO',
      'SANTO ANTONIO',
      'SAO JOSE',
      'SITIO DOS PINTOS',
      'SOLEDADE',
      'TAMARINEIRA',
      'TEJIPIO',
      'TORRE',
      'TORREAO',
      'TORROES',
      'TOTO',
      'VARZEA',
      'VASCO DA GAMA',
      'ZUMBI'
    ];
    widget.bairro = new BairroModel();
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
                    Flexible(
                      child: TextFormField(
                        initialValue: widget.chamado.nomeOrigem,
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
                        initialValue: widget.chamado.dataSolicitacao,
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
                initialValue: widget.chamado.origemChamado,
                decoration: InputDecoration(
                  labelText: "Origem do Chamado"
                ),
                readOnly: true,
              ),
              TextFormField(
                initialValue: widget.chamado.nomeSolicitante,
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
                decoration: InputDecoration(
                  labelText: "Roteiro de Acesso"
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Logradouro"
                ),
                validator: (value){
                  if (value.isEmpty){
                    return "Logradouro inválido";
                  }
                  return null;
                },
                onChanged: (val){
                  widget.chamado.logradouro = val;
                },
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Número"
                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return "Número inválido";
                        }
                        return null;
                      },
                      onChanged: (val){
                        widget.chamado.numero = val;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Complemento"
                      ),
                      onChanged: (val){
                        widget.chamado.complemento = val;
                      },
                    ),
                  )
                ],
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration (
                  labelText: "Bairro",
                ),
                validator: (value) => value == null ? 'Bairro inválido' : null,
                value: dropdownValue,
                icon: Icon(
                    Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (val) {
                  String nomeBairro  = val;
                  var ba = BairroModel();
                  _repBairro.buscarBairro(nomeBairro).then((value){
                    widget.chamado.bairro = value.codigoBairro;
                    ba.rpa = value.rpa;
                    setState(() {
                      _controllerRpa.text = value.rpa.toString();
                      _controllerMr.text = value.mr;
                      _controllerRegional.text = value.regional;
                    });
                  }).catchError((erro){
                    print(erro);
                  });
                },
                items: bairros
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      controller: _controllerRpa,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "RPA"
                      ),
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
                      controller: _controllerMr,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Micro"
                      ),
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
                      controller: _controllerRegional,
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: "Regional"
                      ),
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
                onChanged: (val){
                  widget.chamado.solicitacao=val;
                },
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: CheckboxListTile(
                      value: isSelectedVitima,
                      title: Text("Vítimas"),
                      checkColor: Theme.of(context).primaryColor,
                      onChanged: (bool b){
                        setState(() {
                          isSelectedVitima = b;
                          widget.chamado.vitimas = b ? 0 : 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: CheckboxListTile(
                      value: isSelectedVitimaFatal,
                      title: Text("Vítimas Fatais"),
                      checkColor: Theme.of(context).primaryColor,
                      onChanged: (bool b){
                        setState(() {
                          isSelectedVitimaFatal = b;
                          widget.chamado.vitimasFatais = b ? 0 : 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
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
