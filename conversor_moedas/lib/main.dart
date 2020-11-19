import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//Caminho de solicitação dos dados da API
const request = "https://api.hgbrasil.com/finance?format=json&key=171b4d61";

void main() async {
  print(await getData());
//Pede para construir a tela conforme orientações
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        //Define o tema do app
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          //Define o tema para as rows
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

//Comando para pegar as informações na Api e pedir para retornar
Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

//Criação da tela inicial com 'Stf'
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//Criação do estado inicial da tela
class _HomeState extends State<Home> {
  /*Criação dos controladores de texto, para controlar as informações que são 
  exibidas na tela*/
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  //Função para que limpe os campos de entrada
  void _clearAll() {
    realController.text = "";
    euroController.text = "";
    dolarController.text = "";
  }

  void _realChanged(String text) {
//Teste lógico e chamada da função
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    //Pega a entrada do usuário e transforma em String
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }

    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    realController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    "Carregando Dados...",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao Carregar Dados :O",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: new EdgeInsets.only(bottom: 20.0),
                          child: Icon(
                            Icons.monetization_on,
                            size: 150.0,
                            color: Colors.amber,
                          ),
                        ),
                        /*Chamada da função, orientando quais informações, devem 
                        substituir os parâmetros dentro da função*/
                        buildTextField(
                            "Reais", "R\$ ", realController, _realChanged),
                        /* na chamada do 'controller' e da função '_realChanged', o código executa os 
 comandos que foram orientados, tanto o que foi colocado no controlador
 quanto os parâmetros e funções que foram colocados dentro do _realChanged */
                        Divider(),
                        buildTextField(
                            "Dólares", "US\$ ", dolarController, _dolarChanged),
                        Divider(),
                        buildTextField(
                            /*Na ordem =>
                          String label,
                          String prefix,
                          mainController,
                          mainFunction,
                          */
                            "Euros",
                            "EUR ",
                            euroController,
                            _euroChanged)
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}

/*Criação de uma função com parâmetros. Esses parâmetros
serão referenciados no código, substituindo assim as informações dispostas
dentro dos parênteses*/
Widget buildTextField(String label, String prefix,
    TextEditingController mainController, Function mainFunction) {
  return TextField(
    controller: mainController,
    decoration: InputDecoration(
        //Identifica que o parâmetro label, será alocado aqui
        labelText: label,
        labelStyle: TextStyle(color: Colors.amber),
        border: OutlineInputBorder(),
        //Identifica que o parâmetro prefix, será alocado aqui
        prefixText: prefix),
    style: TextStyle(color: Colors.amber, fontSize: 25.0),
    onChanged: mainFunction,
    keyboardType: TextInputType.number,
  );
}
