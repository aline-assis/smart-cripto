import 'package:flutter/material.dart';
import 'package:smart_finance/grafico/grafico_screen.dart';
import 'package:smart_finance/screens/currency_screen.dart';
import 'package:smart_finance/screens/perfil_screen.dart';
import 'package:smart_finance/widgets/currencies_widget.dart';
//import '/screens/home_screen.dart';

class AppBottomNavigation extends StatefulWidget {
  final int selectedIndex;

  AppBottomNavigation({required this.selectedIndex});
  @override
  State<AppBottomNavigation> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  int _selectedIndex = 0;

  var currentNavigation;

  void initState() {
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    if (currentNavigation == index) {
      return;
    }

    setState(() {
      _selectedIndex = index;
      currentNavigation = index;
    });
    if (_selectedIndex == 0) {
      Navigator.of(context).pushReplacementNamed(Grafico.routeName);
    }
    if (_selectedIndex == 2) {
      Navigator.of(context).pushReplacementNamed(PerfilScreen.routeName);
    }
    if (_selectedIndex == 1) {
      Navigator.of(context).pushReplacementNamed(CurrencyScreen.routeName);
      //Navigator.of(context).pushReplacementNamed(UserHome.routeName);
    }
    // if (_selectedIndex == 3) {
    //   //Navigator.of(context).pushReplacementNamed(UserHome.routeName);

    // }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xff1a2027),
      //backgroundColor: Color(0xff9871f5),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Rank'),
        //BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
        //BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white70,
      onTap: _onItemTapped,
    );
  }
}
