class Chamados {
  String? logradouro;
  String? complemento;
  String? bairro;
  String? registro;
  String? descricao;
  String? status;
  String? dataAtualizacao;

  Chamados(
      {this.logradouro,
      this.complemento,
      this.bairro,
      this.registro,
      this.descricao,
      this.status,
      this.dataAtualizacao});

  Chamados.fromJson(Map<String, dynamic> json) {
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    registro = json['registro'];
    descricao = json['descricao'];
    status = json['status'];
    dataAtualizacao = json['data_atualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['registro'] = this.registro;
    data['descricao'] = this.descricao;
    data['status'] = this.status;
    data['data_atualizacao'] = this.dataAtualizacao;
    return data;
  }
}