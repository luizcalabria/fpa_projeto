import 'package:flutter/material.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
class DetailsView extends StatelessWidget {
  final ChamadoModel chamado;
  DetailsView({@required this.chamado});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Monitoramento de Áreas de Risco"
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
