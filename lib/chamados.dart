import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cadastro.dart';
import 'cadastro1.dart';
import 'telaInicial.dart';
import 'telaLogin.dart';
import 'chamados.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class TelaChamados extends StatefulWidget {
  const TelaChamados({super.key});

  @override
  _TelaChamadosState createState() => _TelaChamadosState();
}

class _TelaChamadosState extends State<TelaChamados> {
  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  Widget buildLogradouro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Logradouro',
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
            controller: _logradouroController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'Ex: Rua Manoel Pedro Espinhosa',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildComplemento() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Complemento',
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
            controller: _complementoController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'Ex: Mercado São José',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildBairro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Bairro',
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
            controller: _bairroController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: 'Ex: Osório Pedro',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildDescricao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Descrição (Opcional)',
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
            controller: _descricaoController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: '',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildImagem(BuildContext context) {
    File? _image;

    void _getImage(ImageSource source) async {
      final pickedFile = await ImagePicker().getImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          print('Minha imagem é: $_image');
        });
      }
    }

    void _showPicker(context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Selecionar da galeria'),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Tirar foto'),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Fotos',
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
            onTap: () {
              _showPicker(context);
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 20),
                hintText: '',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget buildAbrirChamadoBtn() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            primary: Color(0xcc1FF5BE),
            onPrimary: Colors.white,
          ),
          onPressed: () {
            print('Abrir Chamado Pressionado');
            _submitAbrirChamado();
          },
          child: Text(
            'Abrir Chamado',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> makeAbrirChamadoRequest(String logradouro,
      String complemento, String bairro, String descricao, String email) async {
    final baseUrl =
        'https://mapcidade-api.ryan-araujoara1.repl.co/mapcidade/v1/chamados';
    final url = '$baseUrl?email=$email';

    try {
      final dio = Dio();
      final response = await dio.post(
        url,
        data: {
          'logradouro': logradouro,
          'complemento': complemento,
          'bairro': bairro,
          'descricao': descricao,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          // Processar os dados retornados pela API
          print(data);
          Navigator.of(context).pushNamed('/chamadoCriado');
          return data;
        } else {
          throw Exception('Erro na chamada HTTP: Resposta inválida');
        }
      } else {
        throw Exception('Erro na chamada HTTP: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro na chamada HTTP: $e');
    }
  }

  Future<void> _submitAbrirChamado() async {
    final String logradouro = _logradouroController.text;
    final String complemento = _complementoController.text;
    final String bairro = _bairroController.text;
    final String descricao = _descricaoController.text;

    // Recuperar o email salvo no SharedPreferences
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String email = preferences.getString('email') ?? '';

    makeAbrirChamadoRequest(logradouro, complemento, bairro, descricao, email)
        .then((data) {
      // Processar os dados retornados pela API
      print(data);
    }).catchError((error) {
      // Tratar erros na chamada HTTP
      print('Erro na chamada HTTP: $error');
    });
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
                      Color.fromARGB(255, 32, 32, 32),
                      Color.fromARGB(255, 32, 32, 32),
                      Color.fromARGB(255, 32, 32, 32),
                      Color.fromARGB(255, 32, 32, 32),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Insira as informações pendentes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 25),
                      buildLogradouro(),
                      SizedBox(height: 15),
                      buildComplemento(),
                      SizedBox(height: 15),
                      buildBairro(),
                      SizedBox(height: 15),
                      buildImagem(context),
                      SizedBox(height: 15),
                      buildDescricao(),
                      SizedBox(height: 15),
                      buildAbrirChamadoBtn(),
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
