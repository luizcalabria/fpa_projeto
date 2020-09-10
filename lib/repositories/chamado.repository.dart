import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/settings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class ChamadoRepository{
  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(),DATABASE_NAME),
      onCreate: (db,version) async{
        return await db.execute(CREATE_TBBAIRRO);
        return await db.execute(CREATE_TBCHAMADO);
        return await db.execute(CREATE_TBCOMUNIDADE);
        return await db.execute(CREATE_TBUSUARIO);
        return await db.execute(INSERT_BAIRROS);
      },
      version: 1,
    );
  }

  Future insertChamado(ChamadoModel chamado) async{
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TBCHAMADO,
        chamado.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }catch(ex){
      print(ex);
      return;
    }
  }

  Future<List<ChamadoModel>> listarChamados() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(TBCHAMADO);
      return List.generate(
          maps.length,
              (i) {
            return ChamadoModel(
              processo: maps[i]['processo'],
              nomeOrigem: maps[i]['nomeOrigem'],
              dataSolicitacao: maps[i]['dataSolicitacao'],
              origemChamado: maps[i]['origemChamado'],
              nomeSolicitante: maps[i]['nomeSolicitante'],
              enderecoOcorrencia: maps[i]['enderecoOcorrencia'],
              comunidade: maps[i]['comunidade'],
              roteiro: maps[i]['roteiro'],
              solicitacao: maps[i]['solicitacao'],
              vitimas: maps[i]['vitimas'],
              vitimasFatais: maps[i]['vitimasFatais'],
              statusChamado: maps[i]['statusChamado'],
            );
          }
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }

  Future<ChamadoModel> buscarChamado(int processo) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(
          TBUSUARIO,
          where: "processo = ?",
          whereArgs: [
            [processo],
          ]
      );
        return ChamadoModel(
          processo: maps[0]['processo'],
          nomeOrigem: maps[0]['nomeOrigem'],
          dataSolicitacao: maps[0]['dataSolicitacao'],
          origemChamado: maps[0]['origemChamado'],
          nomeSolicitante: maps[0]['nomeSolicitante'],
          enderecoOcorrencia: maps[0]['enderecoOcorrencia'],
          comunidade: maps[0]['comunidade'],
          roteiro: maps[0]['roteiro'],
          solicitacao: maps[0]['solicitacao'],
          vitimas: maps[0]['vitimas'],
          vitimasFatais: maps[0]['vitimasFatais'],
          statusChamado: maps[0]['statusChamado'],
        );
    }catch(ex){
      print(ex);
      return null;
    }
  }
}