//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/grafico/grafico_screen.dart';
import 'package:smart_finance/grafico/menu_controller.dart';
import 'package:smart_finance/grafico/provider/crypto_provider_grafico.dart';
import 'package:smart_finance/providers/currency_provider.dart';
import 'package:smart_finance/screens/currency_screen.dart';
import 'package:smart_finance/screens/geral_screen.dart';
import 'package:smart_finance/screens/home_screen.dart';
import 'package:smart_finance/screens/perfil_screen.dart';
import 'package:smart_finance/screens/welcome_screen.dart';
import 'package:smart_finance/screens/auth_screen.dart';
import 'providers/auth_provider.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(SmartFinanceApp());
}

class SmartFinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CurrencyProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MenuController(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CryptoProviderGrafico(),
        ),
        // ChangeNotifierProvider( ADICIONAR OS NOVOS PROVIDER
        //   create: (ctx) => PerfilProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'SmartFinance',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          // ignore: deprecated_member_use
          accentColor: Color(0xff1a2027),
          fontFamily: 'Roboto',
        ),
        //home: authData.isAuth! ? HomeScreen() : WelcomeScreen(),
        home: Consumer<AuthProvider>(
          builder: (ctx, authData, child) => authData.isAuth!
              ? Grafico()
              : FutureBuilder(
                  future: authData.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : Grafico(),
                ),
        ),
        routes: {
          WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
          PerfilScreen.routeName: (ctx) => PerfilScreen(),
          GeralScreen.routeName: (ctx) => GeralScreen(),
          CurrencyScreen.routeName: (ctx) => CurrencyScreen(),
          Grafico.routeName: (ctx) => Grafico(),
        },
      ),
    );
  }
}
