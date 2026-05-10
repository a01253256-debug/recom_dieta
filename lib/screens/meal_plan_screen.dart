// meal_plan_screen.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/user_profile.dart';
import '../services/nutrition_calculator.dart';
import '../data/meal_database.dart';
import '../models/meal.dart';

class MealPlanScreen extends StatelessWidget {
  final UserProfile profile;

  const MealPlanScreen({
    super.key,
    required this.profile,
  });

      // Convierte el id del objetivo a texto legible
    String _goalLabel(String goal) {
      switch (goal) {
        case 'loss':     return 'Bajar de peso';
        case 'gain':     return 'Subir de peso';
        case 'maintain': return 'Mantener peso';
        default:         return '';
      }
    }

    // Tarjeta de resumen superior (calorías, semanas, macros)
    Widget _buildSummaryCard(double dailyCalories, double weeks, Map<String, double> macros) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tu resumen diario', style: AppTextStyles.tag),
            const SizedBox(height: 16),

            // Fila de calorías y semanas
            Row(
              children: [
                _buildStatChip(Icons.local_fire_department_outlined,
                    '${dailyCalories.toInt()} kcal', 'por día'),
                const SizedBox(width: 12),
                if (weeks > 0)
                  _buildStatChip(Icons.calendar_month_outlined,
                      '${weeks.toStringAsFixed(1)} sem', 'estimadas'),
              ],
            ),
            const SizedBox(height: 16),

            // Fila de macros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMacroChip('Proteína', macros['protein']!, 'g', AppColors.primaryLight),
                _buildMacroChip('Carbos',   macros['carbs']!,   'g', const Color(0xFF7EC8E3)),
                _buildMacroChip('Grasas',   macros['fat']!,     'g', const Color(0xFFE3A87E)),
              ],
            ),
          ],
        ),
      );
    }

    // Chip de estadística (kcal / semanas)
    Widget _buildStatChip(IconData icon, String value, String label) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryLight, size: 16),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: AppTextStyles.buttonSecondary),
                Text(label,  style: AppTextStyles.footer),
              ],
            ),
          ],
        ),
      );
    }

    // Chip de macronutriente
    Widget _buildMacroChip(String name, double value, String unit, Color color) {
      return Column(
        children: [
          Text('${value.toInt()}$unit',
              style: AppTextStyles.buttonSecondary.copyWith(color: color)),
          const SizedBox(height: 2),
          Text(name, style: AppTextStyles.footer),
        ],
      );
    }

    // Sección de un tiempo de comida (desayuno / comida / cena)
    Widget _buildMealSection(String title, IconData icon, List<Meal> meals) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Encabezado de la sección
          Row(
            children: [
              Icon(icon, color: AppColors.primaryLight, size: 18),
              const SizedBox(width: 8),
              Text(title, style: AppTextStyles.tag),
            ],
          ),
          const SizedBox(height: 12),

          // Tarjetas de comidas
          ...meals.map((meal) => _buildMealCard(meal)),
          const SizedBox(height: 24),
        ],
      );
    }

    // Tarjeta individual de una comida
    Widget _buildMealCard(Meal meal) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nombre y calorías
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(meal.name, style: AppTextStyles.buttonSecondary),
                Text('${meal.calories.toInt()} kcal', style: AppTextStyles.footer),
              ],
            ),
            const SizedBox(height: 4),

            // Descripción
            Text(meal.description, style: AppTextStyles.subtitle),
            const SizedBox(height: 10),

            // Macros de la comida
            Row(
              children: [
                _buildMiniMacro('P: ${meal.protein.toInt()}g', AppColors.primaryLight),
                const SizedBox(width: 8),
                _buildMiniMacro('C: ${meal.carbs.toInt()}g',   const Color(0xFF7EC8E3)),
                const SizedBox(width: 8),
                _buildMiniMacro('G: ${meal.fat.toInt()}g',     const Color(0xFFE3A87E)),
              ],
            ),
          ],
        ),
      );
    }

    // Badge pequeño de macro dentro de la tarjeta
    Widget _buildMiniMacro(String text, Color color) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: AppColors.inputFill,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(text,
            style: AppTextStyles.footer.copyWith(color: color)),
      );
    }

  @override
  Widget build(BuildContext context) {
    // Calculamos datos clave
    final double dailyCalories = NutritionCalculator.getDailyCalories(profile);
    final double weeks         = NutritionCalculator.getEstimatedWeeks(profile);
    final macros               = NutritionCalculator.getMacros(profile);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado
              Text('Tu plan nutricional', style: AppTextStyles.heroTitle),
              const SizedBox(height: 4),
              Text(
                'Objetivo: ${_goalLabel(profile.goal)}  ·  '
                '${profile.currentWeight.toInt()} → ${profile.targetWeight.toInt()} kg',
                style: AppTextStyles.subtitle,
              ),
              const SizedBox(height: 24),

              // Tarjeta de resumen
              _buildSummaryCard(dailyCalories, weeks, macros),
              const SizedBox(height: 32),

              // Secciones de comidas — obtenemos las comidas filtradas de la DB
              _buildMealSection(
                'Desayuno', Icons.wb_sunny_outlined,
                MealDatabase.getMealsFor(goal: profile.goal, type: 'breakfast'),
              ),
              _buildMealSection(
                'Comida', Icons.restaurant_outlined,
                MealDatabase.getMealsFor(goal: profile.goal, type: 'lunch'),
              ),
              _buildMealSection(
                'Cena', Icons.nightlight_outlined,
                MealDatabase.getMealsFor(goal: profile.goal, type: 'dinner'),
              ),
            ],
          ),
          //Yurrrr
        ),
      ),
    );
  }
}