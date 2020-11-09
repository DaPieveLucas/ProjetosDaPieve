import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  /*Comando para sobrepor a criação de estado, pelo conteúdo criado dentro do
  _homeState*/
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Tipagem e inicialização das variáveis
  int _people = 0;
  String _infoText = "Pode Entrar!";
  /*Função para mudar o estado da tela, ou seja, aparecer o novo número na tela
  utilizando das variáveis criadas*/
  void _changePeople(int delta) {
    //Quando a função for chamada, substituir a entrada no código, pelo parâmetro imputado
    setState(() {
      _people = _people + delta;

      if (_people < 0) {
        _infoText = "Mundo Invertido ?!";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/rest_imagem.jpeg",
          fit: BoxFit.fitHeight,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //Esse widget recebe o estado atual da var '_people'
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        //ao pressionar o botão, adicionar +1 no parâmetro
                        _changePeople(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        //ao pressionar o botão, subtrair -1 no parâmetro
                        _changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      )),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        ),
      ],
    );
  }
}
