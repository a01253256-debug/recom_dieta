// user_profile.dart
// Datos de usuario después del onboarding (email, objetivo, pesos, etc.)

class UserProfile {
  final String email;
  final String goal;        // 'loss', 'gain', o 'maintain'
  final double currentWeight;
  final double targetWeight;

  // Constructor: así se crea un UserProfile desde afuera
  const UserProfile({
    required this.email,
    required this.goal,
    required this.currentWeight,
    required this.targetWeight,
  });

  double get weightDifference => targetWeight - currentWeight;
}