class Usuario {
  String? email;
  String? nome;
  String? sobrenome;
  String? dataNascimento;
  String? cpf;
  String? cep;
  String? senha;

  Usuario(
      {this.email,
      this.nome,
      this.sobrenome,
      this.dataNascimento,
      this.cpf,
      this.cep,
      this.senha});

  Usuario.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    nome = json['nome'];
    sobrenome = json['sobrenome'];
    dataNascimento = json['data_nascimento'];
    cpf = json['cpf'];
    cep = json['cep'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['nome'] = this.nome;
    data['sobrenome'] = this.sobrenome;
    data['data_nascimento'] = this.dataNascimento;
    data['cpf'] = this.cpf;
    data['cep'] = this.cep;
    data['senha'] = this.senha;
    return data;
  }
}