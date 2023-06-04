import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '13/04/2023',
      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 186, 186, 186)),
    );
  }
}

class Hora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '21:47',
      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 186, 186, 186)),
    );
  }
}

class Rua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Rua. manoel pedro',
      style: TextStyle(fontSize: 19, color: Color.fromARGB(255, 186, 186, 186)),
      textDirection: TextDirection.rtl,
    );
  }
}

class Bairro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Bairro. Osório Pedro',
        style:
            TextStyle(fontSize: 19, color: Color.fromARGB(255, 186, 186, 186)));
  }
}

class Refe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Ref.Mercado São José',
        style:
            TextStyle(fontSize: 19, color: Color.fromARGB(255, 186, 186, 186)));
  }
}

class Status_Analise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //PARTE COLORIDA COM O STATUS DO CHAMADO
        Positioned(
      bottom: 10,
      left: 20,
      right: 170,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 4),
          child: Text(
            'EM ANÁLISE...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Status_Rejeitado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 20,
      right: 170,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 79, 59),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: EdgeInsets.only(left: 25, top: 4),
          child: Text(
            'REJEITADO',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class Status_Atendido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 20,
      right: 170,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 255, 179),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: EdgeInsets.only(left: 30, top: 4),
          child: Text(
            'ATENDIDO',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
