// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$showSearchAtom = Atom(name: '_HomeController.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$chamadosAtom = Atom(name: '_HomeController.chamados');

  @override
  ObservableList<ChamadoModel> get chamados {
    _$chamadosAtom.reportRead();
    return super.chamados;
  }

  @override
  set chamados(ObservableList<ChamadoModel> value) {
    _$chamadosAtom.reportWrite(value, super.chamados, () {
      super.chamados = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_HomeController.search');

  @override
  Future search(int processo) {
    return _$searchAsyncAction.run(() => super.search(processo));
  }

  final _$carregaUsuarioAsyncAction =
      AsyncAction('_HomeController.carregaUsuario');

  @override
  Future carregaUsuario() {
    return _$carregaUsuarioAsyncAction.run(() => super.carregaUsuario());
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic toggleSearch() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearch: ${showSearch},
chamados: ${chamados}
    ''';
  }
}
