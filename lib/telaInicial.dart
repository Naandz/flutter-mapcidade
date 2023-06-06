import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cadastro.dart';
import 'cadastro1.dart';
import 'telaInicial.dart';
import 'telaLogin.dart';
import 'chamados.dart';
import 'telaChamados.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  Widget buildAppBar() {
    return AppBar();
  }

  Widget buildAbrirChamadoBtn() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            primary: Color(0xcc2727F2),
            onPrimary: Colors.white,
          ),
          onPressed: () {
            print('Abrir Chamado Pressionado');
            Navigator.of(context).pushNamed('/chamados');
          },
          child: Text(
            'Abrir um chamado',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildVerificaChamadoBtn() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            primary: Color(0xcc2727F2),
            onPrimary: Colors.white,
          ),
          onPressed: () {
            print('Verificar chamado pressionado');
            Navigator.of(context).pushNamed('/telaChamados');
          },
          child: Text(
            'Verificar seus chamados',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildSairDaContaBtn() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            primary: Color(0xccF26133),
            onPrimary: Colors.white,
          ),
          onPressed: () {
            print('Sair da conta Pressionado');
            Navigator.of(context).pushReplacementNamed('/');
          },
          child: Text(
            'Sair da conta',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Barra_do_app(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 32, 32, 32),
                    Color.fromARGB(255, 32, 32, 32),
                    Color.fromARGB(255, 32, 32, 32),
                    Color.fromARGB(255, 32, 32, 32),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildAbrirChamadoBtn(),
                    SizedBox(height: 15),
                    buildVerificaChamadoBtn(),
                    SizedBox(height: 100),
                    buildSairDaContaBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
