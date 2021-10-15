//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/cripto/teste_screen.dart';
import 'package:smart_finance/providers/perfil_provider.dart';
import 'package:smart_finance/screens/auth_screen.dart';
import 'package:smart_finance/screens/banco_screen.dart';
import 'package:smart_finance/cripto/welcome_screen.dart';
import 'package:smart_finance/screens/onboarding_screen.dart';
import 'package:smart_finance/screens/perfil_screen.dart';

import 'screens/fatura_screen.dart';
import 'providers/auth_provider.dart';
import 'screens/home_screen.dart';
import 'screens/saldo_screen.dart';

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
          create: (ctx) => PerfilProvider(),
        )
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, authData, child) => MaterialApp(
          title: 'SmartFinance',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            // ignore: deprecated_member_use
            accentColor: Colors.deepPurpleAccent[50],
            fontFamily: 'Roboto',
          ),
          //home: authData.isAuth! ? HomeScreen() : AuthScreen(),
          home: authData.isAuth! ? HomeScreen() : WelcomeScreen(),
          routes: {
            TesteScreen.routeName: (ctx) => TesteScreen(),
            WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            FaturaMensalScreen.routeName: (ctx) => FaturaMensalScreen(),
            SaldoScreen.routeName: (ctx) => SaldoScreen(),
            PerfilFormScreen.routeName: (ctx) => PerfilFormScreen(),
            BancoScreen.routeName: (ctx) => BancoScreen(),
          },
        ),
      ),
    );
  }
}
