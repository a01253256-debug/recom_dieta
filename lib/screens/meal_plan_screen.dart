// meal_plan_screen.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/user_profile.dart';
import '../services/nutrition_calculator.dart';

class MealPlanScreen extends StatelessWidget {
  final UserProfile profile;

  const MealPlanScreen({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    // Calculamos datos clave
    final double dailyCalories = NutritionCalculator.getDailyCalories(profile);
    final double weeks         = NutritionCalculator.getEstimatedWeeks(profile);
    final macros               = NutritionCalculator.getMacros(profile);
    final mealsCalories        = NutritionCalculator.getCaloriesPerMeal(profile);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Interfaz simple (debug)
              Text('Tu plan nutricional', style: AppTextStyles.heroTitle),
            ],
          ),
        ),
      ),
    );
  }
}