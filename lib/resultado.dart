import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  int pontuacao;
  final void Function() onRestart;
  Resultado(this.pontuacao, this.onRestart); //construtor

  String get fraseResultado {
    if (this.pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 14) {
      return 'Você é bom!';
    } else if (pontuacao < 17) {
      return 'Impressionante!';
    } else {
      return 'Nivel Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        FlatButton(
          onPressed: onRestart,
          textColor: Colors.blue,
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Icon(Icons.refresh), Text("Reiniciar")],
          ),
        )
      ],
    );
  }
}
