import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final Function handleResposta;

  Resposta(this.resposta, this.handleResposta);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(resposta),
      onPressed: handleResposta,
    );
  }
}
