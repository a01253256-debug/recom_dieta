// main.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'theme/app_theme.dart';
 
void main() {
  runApp(const NutriApp());
}
 
class NutriApp extends StatelessWidget {
  const NutriApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp: configura la app entera (tema, rutas, título, etc.)
      title: 'Nutrí',
      debugShowCheckedModeBanner: false, 
 
      // Tema global de la app
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
        fontFamily: 'DMSans', // fuente por defecto para toda la app
      ),
 
      // widget que se muestra al abrir la app
      home: const AppNavigator(),
    );
  }
}
 
// AppNavigator maneja en qué pantalla estamos.
// Usamos StatefulWidget porque la pantalla activa puede cambiar.
class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});
 
  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}
 
class _AppNavigatorState extends State<AppNavigator> {
  String _currentScreen = 'login';
 
 //Funciones a llamar:
  void _handleLogin(String email, String password) {
    debugPrint('Login: $email');
  }
 
  void _handleRegister() {
    setState(() => _currentScreen = 'register');
    debugPrint('Navegar a registro');
  }
 
  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case 'login':
        return LoginScreen(
          onLogin: _handleLogin,
          onRegister: _handleRegister,
        );

      default:
        return LoginScreen(
          onLogin: _handleLogin,
          onRegister: _handleRegister,
        );
    }
  }
}
