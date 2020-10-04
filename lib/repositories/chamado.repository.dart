import 'package:dio/dio.dart';
import 'package:fpa_projeto/models/chamado.model.dart';
import 'package:fpa_projeto/settings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class ChamadoRepository{
  String url = "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyAk7JkWZz8mxW6XaTFuAeAQ21Cbxq86jeM&address=";
  Future<Database> _getDatabase() async{
    //deleteDatabase(join(await getDatabasesPath(),DATABASE_NAME));
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

  Future<dynamic> getLatLng (endereco) async{
    print (url + endereco);
    Response response = await Dio().get(url + endereco);
    double lat = response.data["results"][0]["geometry"]["location"]["lat"];
    double lng = response.data["results"][0]["geometry"]["location"]["lng"];
    return {
      "lat": lat,
      "lng": lng
    };
  }

  Future insertChamado(ChamadoModel chamado) async{
    try {
      String endereco = chamado.logradouro + ", " + chamado.numero + ', recife, pe';
      await getLatLng(endereco).then((latlng) {
        chamado.latitude = latlng["lat"];
        chamado.longitude = latlng["lng"];
        print(latlng);
      }).catchError((err){
        print(err);
      });
      chamado.processo = null;
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
              logradouro: maps[i]['logradouro'],
              numero: maps[i]['numero'],
              complemento: maps[i]['complemento'],
              bairro: maps[i]['bairro'],
              comunidade: maps[i]['comunidade'],
              roteiro: maps[i]['roteiro'],
              solicitacao: maps[i]['solicitacao'],
              vitimas: maps[i]['vitimas'],
              vitimasFatais: maps[i]['vitimasFatais'],
              statusChamado: maps[i]['statusChamado'],
              latitude: maps[i]['latitude'],
              longitude: maps[i]['longitude'],
            );
          }
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }
  Future<List<ChamadoModel>> procurarChamado(int processo) async{
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(
          TBCHAMADO,
          where: "processo >= ?",
          whereArgs: [processo]
      );
      return List.generate(
          maps.length,
              (i) {
            return ChamadoModel(
              processo: maps[i]['processo'],
              nomeOrigem: maps[i]['nomeOrigem'],
              dataSolicitacao: maps[i]['dataSolicitacao'],
              origemChamado: maps[i]['origemChamado'],
              nomeSolicitante: maps[i]['nomeSolicitante'],
              logradouro: maps[i]['logradouro'],
              numero: maps[i]['numero'],
              complemento: maps[i]['complemento'],
              bairro: maps[i]['bairro'],
              comunidade: maps[i]['comunidade'],
              roteiro: maps[i]['roteiro'],
              solicitacao: maps[i]['solicitacao'],
              vitimas: maps[i]['vitimas'],
              vitimasFatais: maps[i]['vitimasFatais'],
              statusChamado: maps[i]['statusChamado'],
              latitude: maps[i]['latitude'],
              longitude: maps[i]['longitude'],
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
          TBCHAMADO,
          where: "processo = ?",
          whereArgs: [processo]
      );
        return ChamadoModel(
          processo: maps[0]['processo'],
          nomeOrigem: maps[0]['nomeOrigem'],
          dataSolicitacao: maps[0]['dataSolicitacao'],
          origemChamado: maps[0]['origemChamado'],
          nomeSolicitante: maps[0]['nomeSolicitante'],
          logradouro: maps[0]['logradouro'],
          numero: maps[0]['numero'],
          complemento: maps[0]['complemento'],
          bairro: maps[0]['bairro'],
          comunidade: maps[0]['comunidade'],
          roteiro: maps[0]['roteiro'],
          solicitacao: maps[0]['solicitacao'],
          vitimas: maps[0]['vitimas'],
          vitimasFatais: maps[0]['vitimasFatais'],
          statusChamado: maps[0]['statusChamado'],
          latitude: maps[0]['latitude'],
          longitude: maps[0]['longitude'],
        );
    }catch(ex){
      print(ex);
      return null;
    }
  }
}