// meal.dart
// Estructura de datos para representar una comida.
class Meal {
  final String name;
  final String type;
  final String goal;
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final String description;

  const Meal({
    required this.name,
    required this.type,
    required this.goal,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.description,
  });
}