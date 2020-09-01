import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Container(
              child: SizedBox(
                child: Image.asset("assets/images/defesa_civil.jpg"),
                height: 128,
                width: 128,
              )
          ),
          SizedBox(
            height: 10,
          ),
          Icon(
            Icons.fingerprint,
            size: 72,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Defesa Civil de Recife",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).accentColor
            ),
          )
        ],
      ),
    );
  }
}
