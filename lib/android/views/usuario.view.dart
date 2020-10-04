import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/splash.view.dart';
import 'package:fpa_projeto/models/usuario.model.dart';
import 'package:fpa_projeto/repositories/usuario.repository.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class UsuarioView extends StatefulWidget {
  var  usuario;
  UsuarioView({this.usuario});

  @override
  _UsuarioViewState createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repUsuario = UsuarioRepository();

  onSubmit(){
    print(widget.usuario.toMap());
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    insert();
  }

  insert(){
    _repUsuario.insertUsuario(widget.usuario).then((_) {
      onSuccess();
    }).catchError((_){
      onError();
    });
  }

  onSuccess(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SplashView(),
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
    final maskCPFController = new MaskedTextController(mask: '000.000.000-00');
    widget.usuario = new UsuarioModel();
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
                  "Cadastro do Usuário"
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
              TextFormField(
                controller: maskCPFController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "CPF"
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'CPF deve ser informado';
                  }
                  if (CPFValidator.isValid(value)){
                    return null;
                  }
                  return "CPF inválido";
                },
                onChanged: (val){
                  widget.usuario.cpf = val;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Nome do Usuário"
                ),
                validator: (value){
                  if (value.isEmpty){
                    return "Nome deve ser informado";
                  }
                  return null;
                },
                onChanged: (val){
                  widget.usuario.nome = val;
                },
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
