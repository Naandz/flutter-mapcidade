import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cadastro.dart';
import 'cadastro1.dart';
import 'classes/usuario.dart';
import 'telaInicial.dart';
import 'telaLogin.dart';
import 'package:http/http.dart' as http;

class TelaCadastro1 extends StatefulWidget {
  @override
  _TelaCadastro1State createState() => _TelaCadastro1State();
}

class _TelaCadastro1State extends State<TelaCadastro1> {
  Usuario? _usuario;
  bool _cadastrarPressed =
      false; // Variável de controle para verificar se o botão foi pressionado
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Recupere os dados passados pela rota
    final routeArgs = ModalRoute.of(context)!.settings.arguments;
    _usuario = routeArgs as Usuario;
  }

  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _senhaNovamenteController =
      TextEditingController();
  Widget buildCpf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'CPF',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _cpfController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'Ex: 000.000.00-00',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildCep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'CEP',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _cepController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'Ex: 451900-000',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _senhaController,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: '********',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildSenhaNovamente() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha Novamente',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: _senhaNovamenteController,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: '********',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildCadastrarBtn() {
    return GestureDetector(
      child: Container(
        // Restante do código...
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // Restante do código...
              ),
          onPressed: _cadastrarPressed
              ? null
              : () {
                  setState(() {
                    _cadastrarPressed =
                        true; // Desativar o botão após o primeiro clique
                  });

                  _usuario?.cep = _cepController.text;
                  _usuario?.cpf = _cpfController.text;
                  _usuario?.senha = _senhaController.text;
                  _makeCadastroUsuario(_usuario!);
                },
          child: null,
          // Restante do código...
        ),
      ),
    );
  }

  Future<void> _makeCadastroUsuario(Usuario _usuario) async {
    print(_usuario);
    final String url =
        'https://mapcidade-api.ryan-araujoara1.repl.co/mapcidade/v1/usuarios'; // Substitua pela sua URL

    try {
      final Dio dio = Dio();
      final response = await dio.post(url, data: _usuario);

      // Acesso aos dados retornados pela API
      if (response.statusCode == 200) {
        Navigator.of(context).pushReplacementNamed('/cadastradoSucesso');
      } else {
        print('Erro durante a requisição: Algum erro com o servidor');
      }
      // Faça algo com os dados aqui
    } catch (error) {
      // Trate os erros de requisição
      print('Erro durante a requisição: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x66544c46),
                      Color(0x99544c46),
                      Color(0xcc544c46),
                      Color(0xff544c46),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 110),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Quase lá...',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 25),
                      buildCpf(),
                      SizedBox(height: 15),
                      buildCep(),
                      SizedBox(height: 15),
                      buildSenha(),
                      SizedBox(height: 15),
                      buildSenhaNovamente(),
                      SizedBox(height: 15),
                      buildCadastrarBtn(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
