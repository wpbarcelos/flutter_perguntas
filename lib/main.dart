import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaIndex = 0;
  int _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': "Qual é sua cor favorita?",
      'respostas': [
        {"texto": 'Preto', "pontuacao": 10},
        {"texto": 'Vermelho', "pontuacao": 5},
        {"texto": 'Verde', "pontuacao": 3},
        {"texto": 'Branco', "pontuacao": 1},
      ]
    },
    {
      'texto': "Qual é o seu animal favorito?",
      'respostas': [
        {"texto": 'Cachorro', "pontuacao": 3},
        {"texto": 'Gato', "pontuacao": 1},
        {"texto": 'Leão', "pontuacao": 2},
        {"texto": 'Sapo', "pontuacao": 4},
      ]
    },
    {
      'texto': "Qual é o seu instrutor favorito ?",
      'respostas': [
        {"texto": 'Akita', "pontuacao": 4},
        {"texto": 'Leo Moura', "pontuacao": 3},
        {"texto": 'Felipe Deschamps', "pontuacao": 6},
        {"texto": 'Diego Fernandes', "pontuacao": 3},
      ]
    },
  ];

  void _responder(int pontuacao) {
    setState(() {
      this._perguntaIndex++;
      this._pontuacaoTotal += pontuacao;
    });
  }

  void restart() {
    setState(() {
      _perguntaIndex = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaIndex < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
          child: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaIndex,
                  onResponse: _responder,
                )
              : Resultado(_pontuacaoTotal, restart),
        ),
      ),
    );
  }
}
