import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  String? _selectedGoal; //objetivo seleccionado 
  final _currentWeightController = TextEditingController(); //controllers para leer los datos de cajitas
  final _targetWeightController  = TextEditingController();

  @override
  void dispose() {
    _currentWeightController.dispose();
    _targetWeightController.dispose();
    super.dispose();
  }

  Widget _buildGoalCard(Map<String, dynamic> goal) {
  // Checamos si esta tarjeta es la que está seleccionada
  final bool isSelected = _selectedGoal == goal['id'];

  //Creación de tarjetas
  return GestureDetector(
    onTap: () => setState(() => _selectedGoal = goal['id']),
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryDark : AppColors.inputFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          // Si está seleccionada, borde verde brillante; si no, borde sutil
          color: isSelected ? AppColors.primaryLight : AppColors.border,
          width: isSelected ? 1 : 0.5,
        ),
      ),
      child: Row(
        children: [
          Icon(goal['icon'], color: AppColors.primaryLight, size: 20),
          const SizedBox(width: 12),
          Text(goal['label'], style: AppTextStyles.buttonSecondary),
          const Spacer(),
          if (isSelected)
            const Icon(Icons.check_circle, color: AppColors.primaryLight, size: 18),
        ],
      ),
    ),
  );
}

  //lista de opciones
  final List<Map<String, dynamic>> _goals = [
    {'id': 'loss',    'label': 'Bajar de peso',      'icon': Icons.trending_down},
    {'id': 'gain',    'label': 'Subir de peso',       'icon': Icons.trending_up},
    {'id': 'maintain','label': 'Mantener mi peso',    'icon': Icons.monitor_heart_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título de la pantalla
                Text('Cuéntanos sobre ti', style: AppTextStyles.heroTitle),
                const SizedBox(height: 8),
                Text('Esto nos ayudará a calcular tus calorías diarias.',
                    style: AppTextStyles.subtitle),
                const SizedBox(height: 32),

                // Sección de objetivos
                Text('¿Cuál es tu objetivo?', style: AppTextStyles.tag),
                const SizedBox(height: 12),

                // .map() recorre la lista _goals y construye una tarjeta por cada uno
                ..._goals.map((goal) => _buildGoalCard(goal)),

                const SizedBox(height: 28),

                // Sección de pesos
                Text('¿Cuánto pesas ahora?', style: AppTextStyles.tag),
                const SizedBox(height: 12),
                TextField(
                  controller: _currentWeightController,
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.inputText,
                  decoration: InputDecoration(
                    hintText: 'Peso actual (kg)',
                    hintStyle: AppTextStyles.inputHint,
                    suffixText: 'kg',
                    suffixStyle: AppTextStyles.inputHint,
                    filled: true,
                    fillColor: AppColors.inputFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderInput, width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderInput, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Text('¿Cuánto quieres pesar?', style: AppTextStyles.tag),
                const SizedBox(height: 12),
                TextField(
                  controller: _targetWeightController,
                  keyboardType: TextInputType.number,
                  style: AppTextStyles.inputText,
                  decoration: InputDecoration(
                    hintText: 'Peso deseado (kg)',
                    hintStyle: AppTextStyles.inputHint,
                    suffixText: 'kg',
                    suffixStyle: AppTextStyles.inputHint,
                    filled: true,
                    fillColor: AppColors.inputFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderInput, width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderInput, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.primary, width: 1),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Botón de continuar (lo conectamos en el siguiente paso)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => debugPrint('Continuar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text('Continuar', style: AppTextStyles.buttonPrimary),
                  ),
                ),
              ],
          ), //yurrr
        ),
      ),
    );
  }
}