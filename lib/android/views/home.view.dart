import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/details.view.dart';
import 'package:fpa_projeto/models/chamado.model.dart';

import 'chamado.view.dart';
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
                child: SizedBox(
                  child: Image.asset("assets/images/defesa_civil.jpg"),
                  height: 28,
                  width: 28,
                )
            ),
            Text(
              "Meus Processos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 35,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
                "00000000"
            ),
            trailing: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(

                    builder: (context) => DetailsView(
                      chamado: ChamadoModel(
                        processo: 0
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
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChamadoView(
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
