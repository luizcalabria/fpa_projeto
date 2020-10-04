import 'package:fpa_projeto/models/bairro.model.dart';
import 'package:fpa_projeto/settings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class BairroRepository{
  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(),DATABASE_NAME),
      onCreate: (db,version) async{
        await db.execute(CREATE_TBCHAMADO);
        await db.execute(CREATE_TBBAIRRO);
        await db.execute(CREATE_TBCOMUNIDADE);
        await db.execute(CREATE_TBUSUARIO);
        await db.execute(INSERT_BAIRROS1);
        await db.execute(INSERT_BAIRROS2);
        await db.execute(INSERT_BAIRROS3);
        await db.execute(INSERT_BAIRROS4);
        return await db.execute(INSERT_BAIRROS5);
      },
      version: 1,
    );
  }

  Future<List<BairroModel>> listarBairro() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(TBBAIRRO);
      return List.generate(
          maps.length,
              (i) {
            return BairroModel(
              codigoBairro: maps[i]['codigoBairro'],
              nomeBairro: maps[i]['nomeBairro'],
              rpa: maps[i]['rpa'],
              mr: maps[i]['mr'],
              regional: maps[i]['regional'],
            );
          }
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }

  Future<BairroModel> buscarBairro(String nomeBairro) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(
          TBBAIRRO,
          where: "nomeBairro = ?",
          whereArgs: [nomeBairro]
      );
      return BairroModel(
        codigoBairro: maps[0]['codigoBairro'],
        nomeBairro: maps[0]['nomeBairro'],
        rpa: maps[0]['rpa'],
        mr: maps[0]['mr'],
        regional: maps[0]['regional'],
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }

  Future<BairroModel> buscarPorCodigo(int codigoBairro) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(
          TBBAIRRO,
          where: "codigoBairro = ?",
          whereArgs: [codigoBairro]
      );
      return BairroModel(
        codigoBairro: maps[0]['codigoBairro'],
        nomeBairro: maps[0]['nomeBairro'],
        rpa: maps[0]['rpa'],
        mr: maps[0]['mr'],
        regional: maps[0]['regional'],
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }
}