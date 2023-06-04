import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './variaveis.dart';
import 'package:http/http.dart' as http;

import 'classes/chamados.dart';

class ExecutarVerificar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(child: Barra_do_app()),
      Positioned(child: TelaChamado1())
    ]));
  }
}

class TelaChamado1 extends StatefulWidget {
  @override
  _TelaChamado1State createState() => _TelaChamado1State();
}

class _TelaChamado1State extends State<TelaChamado1> {
  List<dynamic> dados = []; // Variável para armazenar os dados da API

  @override
  initState() {
    super.initState();
    carregarDados(); // Chamada para carregar os dados da API no início
  }

  Future<void> carregarDados() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final String email = preferences.getString('email') ?? '';

      final String url =
          'https://mapcidade-api.ryan-araujoara1.repl.co/mapcidade/v1/chamados?email=$email';
      // Fazer a requisição GET para a API e receber a resposta
      final Dio dio = Dio();
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        // Se a requisição foi bem-sucedida (status 200), atualize os dados com a resposta da API
        setState(() {
          dados = response.data; // Decodificar os dados da resposta JSON
          print(dados);
        });
      } else {
        // Se a requisição falhou, exiba um erro ou faça outra tratativa adequada
        print('Erro na requisição: ${response.statusCode}');
      }
    } catch (e) {
      // Se ocorreu algum erro durante a requisição, exiba um erro ou faça outra tratativa adequada
      print('Erro na requisição: $e');
    }
  }

  Widget getChamadoWidget(dynamic item) {
    final String status = item['status'];
    switch (status) {
      case 'analise':
        return Chamado_Analise(
          logradouro: item['logradouro'],
          bairro: item['bairro'],
          complemento: item['complemento'],
          dataAtualizacao: item['dataAtualizacao'],
          descricao: item['descricao'],
        );
      case 'atendido':
        return Chamado_Atendido(
          logradouro: item['logradouro'],
          bairro: item['bairro'],
          complemento: item['complemento'],
          dataAtualizacao: item['dataAtualizacao'],
          descricao: item['descricao'],
        );
      case 'rejeitado':
        return Chamado_Rejeitado(
          logradouro: item['logradouro'],
          bairro: item['bairro'],
          complemento: item['complemento'],
          dataAtualizacao: item['dataAtualizacao'],
          descricao: item['descricao'],
        );
      default:
        return Container(); // Return an empty container if the status is unknown or not provided
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dados.length,
      itemBuilder: (context, index) {
        final dynamic item = dados[index];
        return getChamadoWidget(item);
      },
    );
  }
}

class Chamado_Analise extends StatelessWidget {
  final String logradouro;
  final String bairro;
  final String complemento;
  final String dataAtualizacao;
  final String descricao;

  Chamado_Analise(
      {required this.complemento,
      required this.bairro,
      required this.logradouro,
      required this.dataAtualizacao,
      required this.descricao});

  @override
  Widget build(BuildContext buildContext) {
    return Center(
        child: Stack(children: [
      //ESPAÇAMENTO ENTRE AS CAIXAS
      SizedBox(height: 20),
      //CRIANDO QUADRADO AZUL
      Container(
          width: 350,
          height: 150,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 4, 255),
              borderRadius: BorderRadius.circular(20)),
          //  STACK PARA EMPILHAR WIDGETS
          child: Stack(children: [
            Positioned(
                top: 15,
                left: 20,
                //CIRCULO CINZA DE FOTOS
                child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ))),
            //FOTOS ENVIADAS DEBAIXO DA BOLA
            Positioned(
                top: 45,
                left: 5,
                right: 250,
                child: Container(
                    child: Text(
                  'FOTO ENVIADA',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                ))),
            //TEXTO DA LOCALIZAÇÃO DA RUA
            Positioned(
              top: 10,
              left: 50,
              right: 10,
              child: Container(
                //COLUNA DENTRO DO PRÓPRIO CONTAINER DO TEXTO PARA FAZER A LINHA (DIVIDER)
                child: Column(
                    //crossAxisAlignment para alinhar as classes dentro de uma coluna
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(logradouro,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                      Text(bairro,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                      Text(complemento,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                      SizedBox(
                        height: 15,
                      ),
                      //LINHA CINZA DEBAIXO DO TEXTO DA RUA
                      Container(
                        height: 2,
                        color: Color.fromARGB(255, 186, 186, 186),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      //DATA ABAIXO DA LINHA
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                             Text(
                              dataAtualizacao,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ]),
                    ]),
              ),
            ),
            //ESPAÇAMENTO/POSICIONAMENTO DO CONTAINER AMARELO
            Status_Analise(),
          ]))
    ]));
  }
}

class Chamado_Rejeitado extends StatelessWidget {
  final String logradouro;
  final String bairro;
  final String complemento;
  final String dataAtualizacao;
  final String descricao;

  Chamado_Rejeitado({
    required this.complemento,
    required this.bairro,
    required this.logradouro,
    required this.dataAtualizacao,
    required this.descricao,
  });

  @override
  Widget build(BuildContext buildContext) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //ESPAÇAMENTO ENTRE AS CAIXAS
          SizedBox(height: 20),
          //CRIANDO QUADRADO AZUL
          Container(
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 4, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            //  STACK PARA EMPILHAR WIDGETS
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 20,
                  //CIRCULO CINZA DE FOTOS
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                //FOTOS ENVIADAS DEBAIXO DA BOLA
                Positioned(
                  top: 45,
                  left: 5,
                  right: 250,
                  child: Container(
                    child: Text(
                      'FOTO ENVIADA',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 232, 232, 232),
                      ),
                    ),
                  ),
                ),
                //TEXTO DA LOCALIZAÇÃO DA RUA
                Positioned(
                  top: 10,
                  left: 50,
                  right: 10,
                  child: Container(
                    //COLUNA DENTRO DO PRÓPRIO CONTAINER DO TEXTO PARA FAZER A LINHA (DIVIDER)
                    child: Column(
                      //crossAxisAlignment para alinhar as classes dentro de uma coluna
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(logradouro,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        Text(bairro,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                       Text(complemento,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        SizedBox(height: 15),
                        //LINHA CINZA DEBAIXO DO TEXTO DA RUA
                        Container(
                          height: 2,
                          color: Color.fromARGB(255, 186, 186, 186),
                        ),
                        SizedBox(height: 2),
                        //DATA ABAIXO DA LINHA
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(dataAtualizacao,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //ESPAÇAMENTO/POSICIONAMENTO DO CONTAINER AMARELO
                Status_Rejeitado(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Chamado_Atendido extends StatelessWidget {
  final String logradouro;
  final String bairro;
  final String complemento;
  final String dataAtualizacao;
  final String descricao;

  Chamado_Atendido({
    required this.complemento,
    required this.bairro,
    required this.logradouro,
    required this.dataAtualizacao,
    required this.descricao,
  });

  @override
  Widget build(BuildContext buildContext) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //ESPAÇAMENTO ENTRE AS CAIXAS
          SizedBox(height: 20),
          //CRIANDO QUADRADO AZUL
          Container(
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 4, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            //  STACK PARA EMPILHAR WIDGETS
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 20,
                  //CIRCULO CINZA DE FOTOS
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                //FOTOS ENVIADAS DEBAIXO DA BOLA
                Positioned(
                  top: 45,
                  left: 5,
                  right: 250,
                  child: Container(
                    child: Text(
                      'FOTO ENVIADA',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 232, 232, 232),
                      ),
                    ),
                  ),
                ),
                //TEXTO DA LOCALIZAÇÃO DA RUA
                Positioned(
                  top: 10,
                  left: 50,
                  right: 10,
                  child: Container(
                    //COLUNA DENTRO DO PRÓPRIO CONTAINER DO TEXTO PARA FAZER A LINHA (DIVIDER)
                    child: Column(
                      //crossAxisAlignment para alinhar as classes dentro de uma coluna
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(logradouro,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        Text(bairro,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        Text(complemento,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        SizedBox(height: 15),
                        //LINHA CINZA DEBAIXO DO TEXTO DA RUA
                        Container(
                          height: 2,
                          color: Color.fromARGB(255, 186, 186, 186),
                        ),
                        SizedBox(height: 2),
                        //DATA ABAIXO DA LINHA
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(dataAtualizacao,
                       style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //ESPAÇAMENTO/POSICIONAMENTO DO CONTAINER AMARELO
                Status_Atendido(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Barra_do_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //APPBAR (BARRA DE CIMA COM O ÍCONE)
        AppBar(
      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          'MapCidade',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(width: 2),
        Icon(Icons.search, size: 40)
      ]),
    );
  }
}
