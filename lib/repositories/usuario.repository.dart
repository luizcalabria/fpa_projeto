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
        return await db.execute(CREATE_TBBAIRRO);
        return await db.execute(CREATE_TBCHAMADO);
        return await db.execute(CREATE_TBCOMUNIDADE);
        return await db.execute(CREATE_TBUSUARIO);
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

  Future<List<UsuarioModel>> buscarUsuarios(int id) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String,dynamic>> maps = await db.query(
        TBUSUARIO,
        where: "id = ?",
        whereArgs: [
          id,
        ]
      );
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
}