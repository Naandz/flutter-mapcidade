import 'package:flutter/material.dart';
import './telaChamados.dart';

class ExecutarCriado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Barra_do_app(),
            SizedBox(height: 150),
            Center(
              child: ContainerAviso(),
            ),
            SizedBox(height: 150),
            Center(
              child: Botao(),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerAviso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(color: Color(0xFF33A1FC)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Chamado Criado com Sucesso!!!',
          style: TextStyle(
            color: Color(0xFFF1F1F1),
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Botao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Visualizar chamado pressionado');
        Navigator.of(context).pushNamed('/telaChamados');
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(300, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Color(0xE01CFCBB)),
      ),
      child: Text(
        'Visualizar Chamado',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }
}
