import 'package:flutter/material.dart';
import './telaChamados.dart';
import 'package:dio/dio.dart';

class ExecutarPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(children: [Barra_do_app(), Positioned(child: Tela_Perfil())])
    ]));
  }
}

class Tela_Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 800,
      child: Stack(
        children: [
          Positioned(left: 10, top: 50, child: Foto()),
          Positioned(left: 10, top: 250, child: AreaDosCampos()),
          Positioned(left: 10, top: 250, child: Campo_Email()),
          Positioned(left: 10, top: 350, child: Campo_Nome()),
          Positioned(left: 10, top: 450, child: Campo_CPF()),
        ],
      ),
    );
  }
}

class Foto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200, // altere a posição da sombra conforme necessário
      child: Stack(children: [
        Center(
          child: Container(
            width: 150,
            height: 150,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                elevation: MaterialStatePropertyAll(
                    5), // ajuste o valor conforme necessário
                shadowColor: MaterialStatePropertyAll(
                    Colors.grey), // ajuste a cor conforme necessário
              ),
              child: Center(
                child: Icon(
                    size: 80, Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 27,
            child: Text(
              'Insira sua Foto',
              style:
                  TextStyle(fontSize: 22, color: Color.fromARGB(255, 0, 0, 0)),
            ))
      ]),
    );
  }
}

class AreaDosCampos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            width: 355,
            height: 450,
          )
        ])
      ],
    );
  }
}

class Campo_Nome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Positioned(
              //CONTAINER PAI DESSA CLASSE PARA PODER UTILIZAR OS POSITIONEDS E ETC...
              child: Container(
            width: 355,
            height: 150, // altere a posição da sombra conforme necessário
          )),
          Positioned(
              top: 10,
              left: 25,
              child: Text(
                'Nome:',
                style: TextStyle(fontSize: 24),
              )),
          Positioned(
              top: 40,
              left: 20,
              child: Container(
                width: 315,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 55, 55, 55).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,
                          3), // altere a posição da sombra conforme necessário
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 50,
              left: 25,
              child: Text(
                'José Azevedo Neto',
                style: TextStyle(fontSize: 24),
              ))
        ])
      ],
    );
  }
}

class Campo_Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Positioned(
              //CONTAINER PAI DESSA CLASSE PARA PODER UTILIZAR OS POSITIONEDS E ETC...
              child: Container(
            width: 355,
            height: 150,
          )),
          Positioned(
              top: 10,
              left: 25,
              child: Text(
                'Email:',
                style: TextStyle(fontSize: 24),
              )),
          Positioned(
              top: 40,
              left: 20,
              child: Container(
                width: 315,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 55, 55, 55).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,
                          3), // altere a posição da sombra conforme necessário
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 50,
              left: 25,
              child: Text(
                'joseazedo123@gmail.com',
                style: TextStyle(fontSize: 24),
              ))
        ])
      ],
    );
  }
}

class Campo_CPF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Positioned(
              //CONTAINER PAI DESSA CLASSE PARA PODER UTILIZAR OS POSITIONEDS E ETC...
              child: Container(
            width: 355,
            height: 150,
          )),
          Positioned(
              top: 10,
              left: 25,
              child: Text(
                'CPF:',
                style: TextStyle(fontSize: 24),
              )),
          Positioned(
              top: 40,
              left: 20,
              child: Container(
                width: 315,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 55, 55, 55).withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0,
                          3), // altere a posição da sombra conforme necessário
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 50,
              left: 25,
              child: Text(
                '055.443.756-97',
                style: TextStyle(fontSize: 24),
              ))
        ])
      ],
    );
  }
}
