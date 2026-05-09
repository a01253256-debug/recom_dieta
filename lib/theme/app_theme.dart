// app_theme.dart
// Central de colores y estilos de texto para toda la app.
 
import 'package:flutter/material.dart';
 
class AppColors {
  // Fondos
  static const Color background     = Color(0xFF060E09); // pantalla completa
  static const Color surface        = Color(0xFF0D1A12); // tarjeta/card principal
  static const Color inputFill      = Color(0xFF142019); // fondo de los inputs
  static const Color pillFill       = Color(0xFF142019); // fondo de las pills
 
  // Verdes principales
  static const Color primary        = Color(0xFF2D7A44); // botón primario
  static const Color primaryLight   = Color(0xFF5EBD7A); // acentos y texto verde
  static const Color primaryMuted   = Color(0xFF6B9478); // subtítulos
  static const Color primaryDark    = Color(0xFF1A3D24); // fondo del tag/badge
 
  // Bordes
  static const Color border         = Color(0xFF1E3626);
  static const Color borderInput    = Color(0xFF2A4A34);
 
  // Textos
  static const Color textPrimary    = Color(0xFFE8F5EC); // texto principal 
  static const Color textSecondary  = Color(0xFF6B9478); // texto secundario
  static const Color textInput      = Color(0xFFC8E6D4); // texto dentro de inputs
  static const Color textHint       = Color(0xFF3D6349); // placeholder / hints
  static const Color textPill       = Color(0xFF4A9962); // texto de las pills
  static const Color textError      = Color(0xFFFF6B6B); // mensajes de error
}
 
// Estilos de texto reutilizables.
class AppTextStyles {
  static const TextStyle appName = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
 
  static const TextStyle heroTitle = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 26,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.3,
  );
 
  static const TextStyle tag = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryLight,
    letterSpacing: 1.2,
  );
 
  static const TextStyle subtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondary,
    height: 1.5,
  );
 
  static const TextStyle pill = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textPill,
  );
 
  static const TextStyle inputText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.textInput,
  );
 
  static const TextStyle inputHint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.textHint,
  );
 
  static const TextStyle buttonPrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
 
  static const TextStyle buttonSecondary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryLight,
  );
 
  static const TextStyle footer = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: AppColors.textHint,
  );
 
  static const TextStyle footerLink = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryLight,
  );
 
  static const TextStyle errorText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.textError,
  );
}
