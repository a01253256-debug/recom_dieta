// meal_database.dart
import '../models/meal.dart';

class MealDatabase {
  // Lista completa de comidas disponibles.
  // static const: existe una sola vez en memoria, no cambia.
  static const List<Meal> _allMeals = [

    // ── DESAYUNOS - BAJAR PESO ──────────────────────────────────────────
    Meal(
      name: 'Avena con fruta',
      type: 'breakfast', goal: 'loss',
      calories: 320, protein: 12, carbs: 54, fat: 6,
      description: 'Avena cocida con plátano, fresas y un toque de canela.',
    ),
    Meal(
      name: 'Claras de huevo con espinaca',
      type: 'breakfast', goal: 'loss',
      calories: 210, protein: 28, carbs: 8, fat: 5,
      description: 'Claras revueltas con espinaca salteada y tomate.',
    ),
    Meal(
      name: 'Yogur griego con granola',
      type: 'breakfast', goal: 'loss',
      calories: 280, protein: 18, carbs: 32, fat: 7,
      description: 'Yogur griego natural con granola sin azúcar y miel.',
    ),

    // ── DESAYUNOS - SUBIR PESO ──────────────────────────────────────────
    Meal(
      name: 'Hotcakes de avena con huevo',
      type: 'breakfast', goal: 'gain',
      calories: 620, protein: 32, carbs: 74, fat: 18,
      description: 'Hotcakes de avena con 3 huevos estrellados y jarabe.',
    ),
    Meal(
      name: 'Tostadas con aguacate y huevo',
      type: 'breakfast', goal: 'gain',
      calories: 540, protein: 24, carbs: 52, fat: 24,
      description: 'Dos tostadas integrales con aguacate y huevo pochado.',
    ),
    Meal(
      name: 'Licuado de proteína con avena',
      type: 'breakfast', goal: 'gain',
      calories: 680, protein: 42, carbs: 80, fat: 14,
      description: 'Licuado de plátano, leche entera, avena y proteína en polvo.',
    ),

    // ── DESAYUNOS - MANTENER ────────────────────────────────────────────
    Meal(
      name: 'Huevos revueltos con pan integral',
      type: 'breakfast', goal: 'maintain',
      calories: 420, protein: 24, carbs: 38, fat: 16,
      description: 'Dos huevos revueltos con dos rebanadas de pan integral.',
    ),
    Meal(
      name: 'Bowl de frutas con queso cottage',
      type: 'breakfast', goal: 'maintain',
      calories: 360, protein: 20, carbs: 44, fat: 8,
      description: 'Mix de frutas de temporada con queso cottage y almendras.',
    ),
    Meal(
      name: 'Omelette de verduras',
      type: 'breakfast', goal: 'maintain',
      calories: 390, protein: 26, carbs: 18, fat: 22,
      description: 'Omelette de 3 huevos con pimiento, cebolla y champiñones.',
    ),

    // ── COMIDAS - BAJAR PESO ────────────────────────────────────────────
    Meal(
      name: 'Ensalada de pollo a la plancha',
      type: 'lunch', goal: 'loss',
      calories: 380, protein: 42, carbs: 18, fat: 12,
      description: 'Pechuga de pollo sobre mix de lechugas, pepino y aderezo light.',
    ),
    Meal(
      name: 'Sopa de verduras con atún',
      type: 'lunch', goal: 'loss',
      calories: 340, protein: 36, carbs: 28, fat: 8,
      description: 'Caldo de verduras con atún en agua, zanahoria y calabaza.',
    ),
    Meal(
      name: 'Wrap de pavo con aguacate',
      type: 'lunch', goal: 'loss',
      calories: 420, protein: 38, carbs: 34, fat: 14,
      description: 'Tortilla integral con pavo, aguacate, lechuga y mostaza.',
    ),

    // ── COMIDAS - SUBIR PESO ────────────────────────────────────────────
    Meal(
      name: 'Arroz con pollo y frijoles',
      type: 'lunch', goal: 'gain',
      calories: 780, protein: 52, carbs: 88, fat: 18,
      description: 'Pechuga de pollo con arroz blanco, frijoles y aguacate.',
    ),
    Meal(
      name: 'Pasta con carne molida',
      type: 'lunch', goal: 'gain',
      calories: 820, protein: 48, carbs: 94, fat: 22,
      description: 'Pasta integral con salsa de carne molida y queso parmesano.',
    ),
    Meal(
      name: 'Burrito de res con arroz',
      type: 'lunch', goal: 'gain',
      calories: 860, protein: 54, carbs: 96, fat: 24,
      description: 'Tortilla grande con bistec, arroz, frijoles y guacamole.',
    ),

    // ── COMIDAS - MANTENER ──────────────────────────────────────────────
    Meal(
      name: 'Salmón con verduras al vapor',
      type: 'lunch', goal: 'maintain',
      calories: 520, protein: 46, carbs: 28, fat: 22,
      description: 'Filete de salmón con brócoli, zanahoria y papa al vapor.',
    ),
    Meal(
      name: 'Quesadillas de pollo',
      type: 'lunch', goal: 'maintain',
      calories: 560, protein: 40, carbs: 48, fat: 20,
      description: 'Quesadillas de tortilla integral con pollo y queso Oaxaca.',
    ),
    Meal(
      name: 'Bowl de quinoa con verduras',
      type: 'lunch', goal: 'maintain',
      calories: 490, protein: 22, carbs: 62, fat: 14,
      description: 'Quinoa con garbanzos, espinaca, tomate y aderezo de limón.',
    ),

    // ── CENAS - BAJAR PESO ──────────────────────────────────────────────
    Meal(
      name: 'Caldo de pollo ligero',
      type: 'dinner', goal: 'loss',
      calories: 260, protein: 32, carbs: 16, fat: 6,
      description: 'Caldo de pollo con verduras, sin pasta ni arroz.',
    ),
    Meal(
      name: 'Pescado al limón con ensalada',
      type: 'dinner', goal: 'loss',
      calories: 300, protein: 38, carbs: 12, fat: 10,
      description: 'Filete de tilapia al limón con ensalada verde y pepino.',
    ),
    Meal(
      name: 'Tortitas de atún con verduras',
      type: 'dinner', goal: 'loss',
      calories: 280, protein: 34, carbs: 14, fat: 8,
      description: 'Tortitas de atún horneadas con ensalada de zanahoria rallada.',
    ),

    // ── CENAS - SUBIR PESO ──────────────────────────────────────────────
    Meal(
      name: 'Quesadillas con frijoles y carne',
      type: 'dinner', goal: 'gain',
      calories: 720, protein: 46, carbs: 76, fat: 22,
      description: 'Quesadillas de harina con bistec, frijoles y crema.',
    ),
    Meal(
      name: 'Torta de milanesa',
      type: 'dinner', goal: 'gain',
      calories: 780, protein: 44, carbs: 82, fat: 26,
      description: 'Milanesa de res empanizada en telera con frijoles y aguacate.',
    ),
    Meal(
      name: 'Pozole rojo con pollo',
      type: 'dinner', goal: 'gain',
      calories: 660, protein: 48, carbs: 72, fat: 16,
      description: 'Pozole rojo con pollo deshebrado, tostadas y orégano.',
    ),

    // ── CENAS - MANTENER ────────────────────────────────────────────────
    Meal(
      name: 'Tacos de pollo con guacamole',
      type: 'dinner', goal: 'maintain',
      calories: 480, protein: 36, carbs: 42, fat: 18,
      description: 'Tres tacos de maíz con pollo a la plancha y guacamole.',
    ),
    Meal(
      name: 'Enchiladas verdes',
      type: 'dinner', goal: 'maintain',
      calories: 520, protein: 30, carbs: 52, fat: 20,
      description: 'Enchiladas de pollo con salsa verde, crema y queso fresco.',
    ),
    Meal(
      name: 'Sopa de lentejas',
      type: 'dinner', goal: 'maintain',
      calories: 440, protein: 24, carbs: 58, fat: 10,
      description: 'Lentejas guisadas con zanahoria, tomate y chorizo al gusto.',
    ),
  ];

  // Método para obtener las comidas filtradas por objetivo y tipo
  // Se usa como: MealDatabase.getMealsFor(goal: 'loss', type: 'breakfast')
  static List<Meal> getMealsFor({
    required String goal,
    required String type,
  }) {
    return _allMeals
        .where((meal) => meal.goal == goal && meal.type == type)
        .toList();
  }
}