import 'package:flutter/material.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/repositories/chamado.repository.dart';

class ChamadoView extends StatefulWidget {
  final ChamadoModel chamado;
  ChamadoView({this.chamado})
  @override
  _ChamadoViewState createState() => _ChamadoViewState();
}

class _ChamadoViewState extends State<ChamadoView> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  final _repCganado = ChamadoRepository();
  String dropdownValue ;
  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: "Usuáriodo APP",
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Origem Requerimento"
                    ),
                    onSaved: (sval){
                      widget.chamado.nomeOrigem = sval;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    initialValue: DateFormat('dd/-MM-YYYY – kk:mm.ss').format(DateTime.now()),
                  )
                ],
              ),

              DropdownButtonFormField<String>(
                decoration: InputDecoration (
                labelText: "Bairro",
                ),
              value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
