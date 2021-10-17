//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_finance/screens/welcome_screen.dart';
import 'package:smart_finance/screens/auth_screen.dart';
import 'providers/auth_provider.dart';

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
        // ChangeNotifierProvider( ADICIONAR OS NOVOS PROVIDER
        //   create: (ctx) => PerfilProvider(),
        // )
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
          home: authData.isAuth! ? AuthScreen(isLogin: true) : WelcomeScreen(),
          routes: {
            WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
          },
        ),
      ),
    );
  }
}
