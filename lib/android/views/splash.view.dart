import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/home.view.dart';
import 'package:fpa_projeto/controllers/auth.controller.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final controller = new AuthController();

  @override
  void initState(){
    super.initState();
    controller.authenticate().then((resultado){
      if(resultado == 0) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeView(),
          )
        );
      } else {
        if (resultado == 2){
          //TODO: Tela de Login
        }else{
          //TODO: Mensagem de sem acesso
        }
      }
    }).catchError((erro){
      print(erro);
    });
  }

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
