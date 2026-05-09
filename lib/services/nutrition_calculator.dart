// nutrition_calculator.dart
// Lógica de cálculo de calorías, macros y tiempos estimados para alcanzar el objetivo del usuario.

import '../models/user_profile.dart';

class NutritionCalculator {

  // Calorías base diarias
  static const double _baseCalories = 2000;

  // Ritmo saludable de cambio de peso
  static const double _kgPerWeek = 0.5;

  // Ajuste calórico para subir o bajar ~0.5kg por semana
  // 1kg de grasa ≈ 7700 kcal → 0.5kg/semana ÷ 7 días ≈ 550 kcal/día
  static const double _caloricAdjustment = 550;

  // Calorías diarias recomendadas
  static double getDailyCalories(UserProfile profile) {
    switch (profile.goal) {
      case 'loss':     return _baseCalories - _caloricAdjustment; // déficit
      case 'gain':     return _baseCalories + _caloricAdjustment; // surplus
      case 'maintain': return _baseCalories;                       // mantenimiento
      default:         return _baseCalories;
    }
  }

  // Semanas estimadas para llegar al objetivo
  static double getEstimatedWeeks(UserProfile profile) {
    if (profile.goal == 'maintain') return 0;
    return profile.weightDifference.abs() / _kgPerWeek;
  }

  // ── Distribución de macronutrientes ───────────────────────────────────
  // Devuelve un Map con proteínas, carbos y grasas en gramos.
  // Los porcentajes varían según el objetivo:
  //   Bajar peso: más proteína para conservar músculo
  //   Subir peso: más carbos para energía y músculo
  //   Mantener:   distribución balanceada
  static Map<String, double> getMacros(UserProfile profile) {
    final double calories = getDailyCalories(profile);

    double proteinPct, carbsPct, fatPct;

    switch (profile.goal) {
      case 'loss':
        proteinPct = 0.35; carbsPct = 0.40; fatPct = 0.25;
        break;
      case 'gain':
        proteinPct = 0.30; carbsPct = 0.50; fatPct = 0.20;
        break;
      default: // maintain
        proteinPct = 0.30; carbsPct = 0.45; fatPct = 0.25;
    }

    // Proteínas y carbos tienen 4 kcal/g, grasas tienen 9 kcal/g
    return {
      'protein': (calories * proteinPct) / 4,
      'carbs':   (calories * carbsPct)   / 4,
      'fat':     (calories * fatPct)     / 9,
    };
  }

  // ── Distribución calórica por comida ──────────────────────────────────
  // Desayuno 30%, comida 40%, cena 30% — distribución estándar
  static Map<String, double> getCaloriesPerMeal(UserProfile profile) {
    final double total = getDailyCalories(profile);
    return {
      'breakfast': total * 0.30,
      'lunch':     total * 0.40,
      'dinner':    total * 0.30,
    };
  }
}
