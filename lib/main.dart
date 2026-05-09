// main.dart
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'theme/app_theme.dart';
import 'screens/onboarding_screen.dart';
import 'models/user_profile.dart';
import 'screens/meal_plan_screen.dart'; 
 
void main() {
  runApp(const NutriApp());
}
 
class NutriApp extends StatelessWidget {
  const NutriApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrí',
      debugShowCheckedModeBanner: false, 
 
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surface,
        ),
        fontFamily: 'DMSans',
      ),
 
      // widget que se muestra al abrir la app
      home: const AppNavigator(),
    );
  }
}
 
class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});
 
  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  String _currentScreen = 'login';
  UserProfile? _userProfile;

  // ── Métodos ──
  void _handleLogin(String email, String password) {
    debugPrint('Login: $email');
    setState(() => _currentScreen = 'onboarding');
  }

  void _handleRegister() {
    setState(() => _currentScreen = 'register');
    debugPrint('Navegar a registro');
  }

  void _handleOnboarding(UserProfile profile) {
    setState(() {
      _userProfile = profile;
      _currentScreen = 'mealPlan';
    });
  }

  // ── UI ──
  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case 'login':
        return LoginScreen(
          onLogin: _handleLogin,
          onRegister: _handleRegister,
        );
      case 'onboarding':
        return OnboardingScreen(
          onContinue: _handleOnboarding,
        );
      case 'mealPlan':
        return MealPlanScreen(
          profile: _userProfile!,
        );
      default:
        return LoginScreen(
          onLogin: _handleLogin,
          onRegister: _handleRegister,
        );
    }
  }
}
