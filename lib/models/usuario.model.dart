class UsuarioModel{
  int id = 0;
  String nome = "";
  String cpf  = "";
  String email = "";
  String senha = "";

  UsuarioModel({
    this.id,
    this.cpf,
    this.email,
    this.nome,
    this.senha
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'senha': senha,
    };
  }
}
