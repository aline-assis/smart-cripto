// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/models/perfil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PerfilProvider with ChangeNotifier {
  Perfil? perfil = new Perfil(id: "", cpf: "", date: DateTime.now());
  //FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> fetchAndSetPerfil() async {
    final url = Uri.parse(
        "https://smart-finance-e129a-default-rtdb.firebaseio.com/perfil.json");
    try {
      final response = await http.get(url);
      if (response.body == "null") {
        perfil = null;
        return;
      }
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      var loadedPerfil;
      extractedData.forEach(
        (perfilId, perfilData) {
          loadedPerfil = new Perfil(
            id: perfilId,
            cpf: perfilData['cpf'],
            date: DateTime.parse(perfilData['date']),
            // banco: perfilData['banco'],
          );
        },
      );
      perfil = loadedPerfil;
    } catch (e) {
      throw e;
    }
    notifyListeners();
  }

  Future<void> addPerfil(Perfil perfil) {
    final url = Uri.parse(
        "https://smart-finance-e129a-default-rtdb.firebaseio.com/perfil.json");
    return http
        .post(
      url,
      body: json.encode({
        'cpf': perfil.cpf,
        'date': perfil.date.toString(),
        // 'banco': perfil.banco,
      }),
    )
        .then(
      (response) {
        print(response.body);
        final perfilId = json.decode(response.body) as Map<String, dynamic>;

        this.perfil?.id = perfilId['name'];

        notifyListeners();
      },
    ).catchError((error) {
      throw error;
    });
  }

  Future<void> updatePerfil(String _perfilId, Perfil perfil) {
    final url = Uri.parse(
        "https://smart-finance-e129a-default-rtdb.firebaseio.com/perfil.json");
    return http
        .put(
      url,
      body: json.encode({
        'id': perfil.id,
        'cpf': perfil.cpf,
        'date': perfil.date.toString(),
        // 'banco': perfil.banco,
      }),
    )
        .then(
      (response) {
        print(response.body);
        final perfilId = json.decode(response.body) as Map<String, dynamic>;

        this.perfil?.id = perfilId['name'];

        notifyListeners();
      },
    ).catchError((error) {
      throw error;
    });
  }
}
