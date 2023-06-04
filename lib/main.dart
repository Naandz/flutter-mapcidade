import 'package:flutter/material.dart';
import 'package:login_page/cadastradoSucesso.dart';
import 'package:login_page/chamados.dart';
import 'cadastro.dart';
import 'cadastro1.dart';
import 'telaInicial.dart';
import 'telaLogin.dart';
import 'chamados.dart';
import 'telaChamados.dart';
import 'telaPerfil.dart';
import './chamadoCriado.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const TelaLogin(),
        '/telaInicial': (context) => TelaInicial(),
        '/cadastro': (context) => TelaCadastro(),
        '/cadastro1': (context) => TelaCadastro1(),
        '/chamados': (context) => TelaChamados(),
        '/telaChamados': (context) => ExecutarVerificar(),
        '/telaPerfil': (context) => ExecutarPerfil(),
        '/chamadoCriado': (context) => ExecutarCriado(),
        '/cadastradoSucesso': (context) => CadastradoSucesso(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
