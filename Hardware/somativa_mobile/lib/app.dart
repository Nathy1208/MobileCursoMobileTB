import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_point.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'controllers/auth_controller.dart';
import 'controllers/point_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => PointController()),
      ],
      child: MaterialApp(
        title: 'Registro Ponto',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (_) => LoginScreen(),
          '/home': (_) => HomeScreen(),
          '/register': (_) => RegisterPointScreen(),
          '/history': (_) => HistoryScreen(),
          '/settings': (_) => SettingsScreen(),
        },
      ),
    );
  }
}
