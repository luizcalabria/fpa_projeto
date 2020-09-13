import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpa_projeto/android/views/details.view.dart';
import 'package:fpa_projeto/android/widgets/chamado-list-item.widget.dart';
import 'package:fpa_projeto/android/widgets/procurar-appbar.widget.dart';
import 'package:fpa_projeto/controllers/home.controller.dart';
import 'package:fpa_projeto/globals.dart';
import 'package:fpa_projeto/models/chamado.model.dart';

import 'chamado.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: ProcurarAppBar(
          controller: controller,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Observer(
        builder: (_)=> ListView.builder(
            itemCount: controller.chamados.length,
            itemBuilder: (ctx, i){
              return ChamadoListItem(
                chamado: controller.chamados[i],
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChamadoView(
                  chamado: ChamadoModel(
                    processo: 0,
                    nomeSolicitante: nomeUsuario,
                    origemChamado: "Ocorrências",
                    nomeOrigem: "Usuário do APP",
                    statusChamado: "Enviado para Análise",
                    dataSolicitacao: DateTime.now()
                  ),
                  ),
                )
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).accentColor,
        )
      ),
    );
  }
}
