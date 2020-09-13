import 'package:flutter/material.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/repositories/chamado.repository.dart';
import 'package:mobx/mobx.dart';
part 'home.controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{
  @observable
  bool showSearch = false;

  @observable
  ObservableList<ChamadoModel> chamados = new ObservableList<ChamadoModel>();

  @action
  toggleSearch(){
    showSearch= !showSearch;
  }

  @action
  search(int processo) async{
    final repChamado = new ChamadoRepository();
    chamados = new ObservableList<ChamadoModel>();
    var dados = await repChamado.procurarChamado(processo);
    chamados.addAll(dados);
  }
}