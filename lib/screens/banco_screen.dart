import 'package:flutter/material.dart';
import 'package:smart_finance/widgets/app_bottom_nav.dart';
import 'package:smart_finance/widgets/app_drawer.dart';
import 'package:smart_finance/models/banco.dart';
import 'package:smart_finance/providers/banco_lista_provider.dart';

class BancoScreen extends StatelessWidget {
  /* Uma lista que você irá implementar com os dados dos nomes vindo do firebase 
    Alimente ela dentro do seu StreamBuilder
  */
  static const routeName = "/banco-screen";
  final List<Banco> bancos = [
    Banco(nome: "Nubank"),
    Banco(nome: "Inter"),
    Banco(nome: "Bradesco")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent[200],
        title: Text('Bancos Disponíveis'),
        //actions: [IconButton(onPressed: , icon: Icon(Icons.save))],
      ),
      body: ListView.builder(
        itemCount: bancos.length,
        itemBuilder: (_, int index) {
          return BancoLista(
            item: bancos[index],
            key: key,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent[200],
        child: Icon(Icons.save),
        onPressed: salvar,
      ),
      bottomNavigationBar: AppBottomNavigation(
        selectedIndex: 1,
      ),
    );
  }

  /* Aqui é como você vai pegar os registros selecionados apenas */
  void salvar() {
    List<Banco> itensMarcados = List.from(bancos.where((item) => item.active));

    itensMarcados.forEach((item) {
      print(item.nome);
    });
  }
}
