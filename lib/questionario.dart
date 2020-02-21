import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  // final String pergunta;
  final int perguntaSelecionada;
  final void Function(int pontuacao) onResponse;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.onResponse,
  });

  @override
  Widget build(BuildContext context) {
    List respostas = perguntas[perguntaSelecionada]['respostas'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas
            .map((t) => Resposta(t['texto'], () => onResponse(t['pontuacao'])))
            .toList(),
      ],
    );
  }
}
