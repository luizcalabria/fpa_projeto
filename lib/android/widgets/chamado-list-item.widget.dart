import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/details.view.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
class ChamadoListItem extends StatelessWidget {
  final ChamadoModel chamado;
  ChamadoListItem({
    @required this.chamado,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          chamado.processo.toString().padLeft(10,"0"),
      ),
      trailing: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(

                builder: (context) => DetailsView(
                  chamado: ChamadoModel(
                      processo: chamado.processo
                  ),
                )
            ),
          );
        },
        child: Icon(
          Icons.description,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
