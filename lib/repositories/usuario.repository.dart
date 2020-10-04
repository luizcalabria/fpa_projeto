import 'package:flutter/material.dart';
import 'package:fpa_projeto/models/usuario.model.dart';
import 'package:fpa_projeto/settings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class UsuarioRepository{

  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(),DATABASE_NAME),
      onCreate: (db,version) async{
        await db.execute(CREATE_TBBAIRRO);
        await db.execute(CREATE_TBCHAMADO);
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

  Future insertUsuario(UsuarioModel usuario) async{
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TBUSUARIO,
        usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }catch(ex){
      print(ex);
      return;
    }
  }

  Future<List<UsuarioModel>> listarUsuarios() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(TBUSUARIO);
      return List.generate(
        maps.length,
        (i) {
            return UsuarioModel(
                id: maps[i]["id"],
                cpf: maps[i]["cpf"],
                email: maps[i]["email"],
                nome: maps[i]["nome"],
                senha: maps[i]["senha"]
            );
          }
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }

  Future<int> getCount() async {
    //database connection
    final Database db = await _getDatabase();
    var x = await db.rawQuery('SELECT COUNT (*) from ' + TBUSUARIO);
        int count = Sqflite.firstIntValue(x);
    return count;
  }

  Future<UsuarioModel> buscarUsuarios(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(
        TBUSUARIO,
        where: "$id = ?",
        whereArgs: [id]
      );
      return UsuarioModel(
        id: maps[0]["id"],
        cpf: maps[0]["cpf"],
        email: maps[0]["email"],
        nome: maps[0]["nome"],
        senha: maps[0]["senha"]
      );
    }catch(ex){
      print(ex);
      return null;
    }
  }
}