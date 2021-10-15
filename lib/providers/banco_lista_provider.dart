/* Criei aqui um widget que irá controlar o próprio estado */

import 'package:flutter/material.dart';
import 'package:smart_finance/models/banco.dart';
import 'package:smart_finance/screens/banco_key_screen.dart';

class BancoLista extends StatefulWidget {
  const BancoLista({required Key? key, required this.item}) : super(key: key);

  final Banco item;

  @override
  _BancoListaState createState() => _BancoListaState();
}

class _BancoListaState extends State<BancoLista> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.deepPurpleAccent[200],
      title: Text(widget.item.nome),
      value: widget.item.active,
      onChanged: (bool? value) {
        setState(() {
          widget.item.active = value!;
        });
        if (widget.item.active) {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new BancoKey()),
          );
        }
      },
    );
  }
}
