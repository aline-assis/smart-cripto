//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        // ChangeNotifierProvider( ADICIONAR OS NOVOS PROVIDER
        //   create: (ctx) => PerfilProvider(),
        // )
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, authData, child) => MaterialApp(
          title: 'SmartFinance',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.purple,
            // ignore: deprecated_member_use
            accentColor: Colors.deepPurpleAccent[50],
            fontFamily: 'Roboto',
          ),
          //home: authData.isAuth! ? HomeScreen() : WelcomeScreen(),
          home: Consumer<AuthProvider>(
            builder: (ctx, authData, child) => authData.isAuth!
                ? HomeScreen()
                : FutureBuilder(
                    future: authData.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : WelcomeScreen(),
                  ),
          ),
          routes: {
            WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
            AuthScreen.routeName: (ctx) => AuthScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            PerfilScreen.routeName: (ctx) => PerfilScreen(),
            GeralScreen.routeName: (ctx) => GeralScreen(),
          },
        ),
      ),
    );
  }
}
