import 'package:flutter/material.dart';
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
              "Monitoramento de Áreas de Risco",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 15,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
