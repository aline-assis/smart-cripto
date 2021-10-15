import 'package:flutter/cupertino.dart';

class Perfil with ChangeNotifier {
  String? id;
  String cpf;
  DateTime date;

  Perfil({
    this.id,
    required this.cpf,
    required this.date,
  });
}
