import 'package:flutter/material.dart';
import 'package:login_page/telaLogin.dart';
import './telaChamados.dart';

class CadastradoSucesso extends StatefulWidget {
  @override
  _CadastradoSucessoState createState() => _CadastradoSucessoState();
}

class _CadastradoSucessoState extends State<CadastradoSucesso> {
  @override
  void initState() {
    super.initState();
    redirecionarParaTelaLogin();
  }

  void redirecionarParaTelaLogin() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TelaLogin(),
        ),
      );
    });
  }

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
          'Usuário Criado com Sucesso!!!',
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
