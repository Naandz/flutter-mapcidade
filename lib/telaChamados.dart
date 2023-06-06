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
      appBar: AppBar(
        title: Text(
          'MapCidade',
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Ação ao pressionar o ícone de pesquisa
            },
          ),
        ],
      ),
      body: TelaChamado1(),
    );
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            CaixaAzul(
              logradouro: item['logradouro'],
              bairro: item['bairro'],
              complemento: item['complemento'],
              dataAtualizacao: item['dataAtualizacao'],
              descricao: item['descricao'],
            ),
            SizedBox(height: 10),
          ],
        );
      case 'atendido':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Chamado_Atendido(
              logradouro: item['logradouro'],
              bairro: item['bairro'],
              complemento: item['complemento'],
              dataAtualizacao: item['dataAtualizacao'],
              descricao: item['descricao'],
            ),
            SizedBox(height: 10),
          ],
        );
      case 'rejeitado':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Chamado_Rejeitado(
              logradouro: item['logradouro'],
              bairro: item['bairro'],
              complemento: item['complemento'],
              dataAtualizacao: item['dataAtualizacao'],
              descricao: item['descricao'],
            ),
            SizedBox(height: 10),
          ],
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
          SizedBox(height: 15),
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
                        Text(
                          logradouro,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          bairro,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          complemento,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        //LINHA CINZA DEBAIXO DO TEXTO DA RUA
                        Container(
                          height: 2,
                          width: 25,
                          color: Color.fromARGB(255, 186, 186, 186),
                        ),
                        SizedBox(height: 2),
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
                            Status_Rejeitado(),
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
                        Text(
                          logradouro,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          bairro,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          complemento,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        //LINHA CINZA DEBAIXO DO TEXTO DA RUA
                        Container(
                          width: 100,
                          height: 2,
                          color: Color.fromARGB(255, 186, 186, 186),
                        ),
                        SizedBox(height: 2),
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

class CaixaAzul extends StatelessWidget {
  final String logradouro;
  final String bairro;
  final String complemento;
  final String dataAtualizacao;
  final String descricao;

  CaixaAzul({
    required this.complemento,
    required this.bairro,
    required this.logradouro,
    required this.dataAtualizacao,
    required this.descricao,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 180,

        //CONTAINER FLHO QUE É O AZUL
        child: Stack(children: [
          Positioned(
              left: 23,
              child: Container(
                width: 350,
                height: 180,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 0, 255),
                    borderRadius: BorderRadius.circular(20)),
                //ESPAÇO DENTRO DO MOLDE AZUL QUE É ONDE FICA AS COISAS
                child: Column(children: [
                  //ENDEREÇO
                  Container(
                      width: 350,
                      height: 90,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 15,
                              right: 10,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      complemento,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      bairro,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      logradouro,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ]))
                        ],
                      )),
                  //LINHA CINZA
                  Container(
                      width: 350,
                      height: 15,
                      child: Stack(children: [
                        Positioned(top: 10, right: 5, child: Linha())
                      ])),
                  //STATUS AMARELO E DATA EM UMA LINHA
                  Container(
                    width: 350,
                    height: 75,
                    //ROW COM O STATUS E A DATA
                    child: Row(
                      children: [
                        //STATUS
                        Container(
                            width: 200,
                            height: 90,
                            child: Stack(children: [
                              Positioned(
                                  top: 25, left: -5, child: StatusChamado())
                            ])),
                        //DATA
                        Container(
                            width: 140,
                            height: 40,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 2,
                                    right: 2,
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 50,
                                              child: Text(
                                                dataAtualizacao,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                                maxLines: 2,
                                              ))
                                        ]))
                              ],
                            ))
                      ],
                    ),
                  ),
                ]),
              )

              //ACABA O ESPAÇO DENTRO DO MOLDE
              )
        ]));
  }
}

class Endereco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 5),
      // ENDEREÇO DENTRO DO ALIGN
      Align(
          alignment: Alignment.topRight,
          child: Column(children: [
            //CONTAINER DO ENDEREÇO
            Container(
                width: 300,
                child: Text(
                  'Rua Manoel Bandeira,Bairro Jardim, Refência Supermercado Tonhão',
                  maxLines: 3,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ])),
    ]);
  }
}

class Linha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 230,
        height: 10,
        child: Align(
            alignment: Alignment.topRight,
            child: Container(
                width: 280,
                child: Column(children: [
                  Container(
                    height: 2,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ]))));
  }
}

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 20,
        child: Stack(
          children: [
            Positioned(
                right: 5,
                child: Container(
                    width: 160,
                    child: Stack(children: [
                      Positioned(
                          child: Column(children: [
                        Container(
                            width: 160,
                            child: Text(
                              '06/03/2023-20:17',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.right,
                            ))
                      ]))
                    ])))
          ],
        ));
  }
}

class StatusChamado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Column(children: [
          Container(
              width: 300,
              height: 50,
              child: Stack(children: [
                Positioned(
                    left: 20,
                    //STATUS AMARELO:
                    child: Container(
                        width: 180,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(30)),
                        //POSICIONANDO O TEXTO DENTRO DO STATUS AMARELO COM UM COLUMN (EM ANÁLISE...)
                        child: Column(children: [
                          Container(
                              width: 180,
                              height: 40,
                              child: Stack(children: [
                                Positioned(
                                    top: 7,
                                    left: 10,
                                    child: Text(
                                      'EM ANÁLISE...',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ]))
                        ]) //STATUS AMARELO ACABA AQUI
                        ))
              ]))
        ]));
  }
}
