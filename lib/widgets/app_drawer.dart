import 'package:flutter/material.dart';
import 'package:smart_finance/screens/banco_screen.dart';
import 'package:smart_finance/screens/perfil_screen.dart';
import 'package:smart_finance/screens/saldo_screen.dart';

import '../screens/fatura_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: Colors.deepPurpleAccent[200],
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  "assets/images/home.png",
                ),
              ),
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  "assets/images/invoice.png",
                ),
              ),
            ),
            title: Text('Fatura'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FaturaMensalScreen.routeName);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  "assets/images/saldo.png",
                ),
              ),
            ),
            title: Text('Saldo'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SaldoScreen.routeName);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  "assets/images/setting.png",
                ),
              ),
            ),
            title: Text('Perfil'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(PerfilFormScreen.routeName);
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image(
                image: AssetImage(
                  "assets/images/bank.png",
                ),
              ),
            ),
            title: Text('Banco'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(BancoScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
