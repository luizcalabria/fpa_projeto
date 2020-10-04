import 'package:flutter/material.dart';
import 'package:fpa_projeto/android/views/splash.view.dart';
import 'package:fpa_projeto/android/views/usuario.view.dart';
import 'package:fpa_projeto/repositories/usuario.repository.dart';

import 'loading.view.dart';

class InicioView extends StatefulWidget {
  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  final UsuarioRepository _repUsuario = new UsuarioRepository();
  contarUsuario() async{
    int qtd;
    qtd = await _repUsuario.getCount();
    return qtd;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: contarUsuario(),
      builder: (ctx, snp){
        if (snp.hasData){



          print (snp.data);
          if (snp.data == 0) {
            return UsuarioView();
          }else {
            return SplashView();
          }
        } else{
          return LoadingView();
        }
      },
    );
  }
}

