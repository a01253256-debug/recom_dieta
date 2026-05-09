// login_screen.dart
//pantalla de inicio de sesión, con campos para email y contraseña, botón de login, y enlace a registro.
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
 
// StatefulWidget porque necesitamos guardar lo que el usuario escribe
// y mostrar/ocultar errores.
class LoginScreen extends StatefulWidget {
  // funciones callback (main.dart a aquí)
  final VoidCallback onRegister;        
  final Function(String, String) onLogin; 
 
  const LoginScreen({
    super.key,
    required this.onRegister,
    required this.onLogin,
  });
 
  // Conecta el widget con su State (donde vive la lógica).
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
 
// La clase State es donde viven los datos que pueden cambiar.
// El "_" al inicio significa que es privada (solo accesible en este archivo).
class _LoginScreenState extends State<LoginScreen> {
  // Controllers para los campos de texto (email y contraseña)
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
 
  String _errorMessage      = '';   
  bool _passwordVisible     = false; // para alternar la visibilidad de la contraseña
 
 //dispose es necesario para liberar los recursos de los controllers cuando el widget se destruye. (controlar memoria)
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 
  // Función de validación y login
  void _handleLogin() {
    final email    = _emailController.text.trim();
    final password = _passwordController.text.trim();
 
    // Validaciones básicas
    if (email.isEmpty || password.isEmpty) {
      setState(() => _errorMessage = 'Por favor llena todos los campos.');
      return;
    }
 
    if (!email.contains('@')) {
      setState(() => _errorMessage = 'Ingresa un correo válido.');
      return;
    }
 
    // Si todo está bien, limpiamos el error y llamamos al callback
    setState(() => _errorMessage = '');
    widget.onLogin(email, password); 
  }
 
  // build() es donde construimos la UI.
  // Se llama cada vez que setState() es invocado.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold: estructura base de una pantalla en Flutter
      // (maneja el fondo, AppBar, body, etc.)
      backgroundColor: AppColors.background,
      body: SafeArea(
        // SafeArea: evita que el contenido quede detrás del notch o la barra de estado
        child: SingleChildScrollView(
          // SingleChildScrollView: permite hacer scroll si el contenido no cabe
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Center(
            child: ConstrainedBox(
              // ConstrainedBox: limita el ancho máximo (útil en tablets)
              constraints: const BoxConstraints(maxWidth: 340),
              child: Column(
                // Column: acomoda sus hijos en vertical
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLogo(),
                  const SizedBox(height: 28), // espacio vertical
                  _buildHeroSection(),
                  const SizedBox(height: 20),
                  _buildPills(),
                  const SizedBox(height: 24),
                  _buildForm(),
                  const SizedBox(height: 16),
                  _buildLoginButton(),
                  const SizedBox(height: 16),
                  _buildDivider(),
                  const SizedBox(height: 16),
                  _buildRegisterButton(),
                  const SizedBox(height: 24),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
 
  // ─── Secciones de la UI ────────────────────────────────────────────────
  // Separamos cada sección en su propio método para mantener el código
  // legible. Cada método devuelve un Widget.
 
  Widget _buildLogo() {
    return Row(
      children: [
        // Caja verde con ícono
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.eco_outlined, // ícono de hoja
            color: Color(0xFFA8E6BF),
            size: 20,
          ),
        ),
        const SizedBox(width: 8),
        Text('nutrí', style: AppTextStyles.appName),
      ],
    );
  }
 
  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tag/badge superior
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'TU PLAN, TU CUERPO',
            style: AppTextStyles.tag,
          ),
        ),
        const SizedBox(height: 12),
 
        // Título con parte en color acento
        // RichText: permite mezclar estilos dentro de un mismo texto
        RichText(
          text: TextSpan(
            style: AppTextStyles.heroTitle,
            children: [
              const TextSpan(text: 'Come bien,\nvive '),
              TextSpan(
                text: 'mejor',
                style: AppTextStyles.heroTitle.copyWith(
                  color: AppColors.primaryLight,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
 
        Text(
          'Recetas personalizadas según tus metas y calorías diarias.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
 
  Widget _buildPills() {
    // Lista de objetivos que se muestran como chips decorativos
    final pills = [
      (Icons.trending_down, 'Bajar peso'),
      (Icons.trending_up,   'Subir peso'),
      (Icons.monitor_heart_outlined, 'Mantener'),
    ];
 
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: pills.map((pill) {
        // .map() transforma cada elemento de la lista en un Widget
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.pillFill,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border, width: 0.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Icon(pill.$1, size: 12, color: AppColors.textPill),
              const SizedBox(width: 4),
              Text(pill.$2, style: AppTextStyles.pill),
            ],
          ),
        );
      }).toList(), // .toList() convierte el resultado del map en una lista
    );
  }
 
  Widget _buildForm() {
    return Column(
      children: [
        // Campo de correo
        _buildTextField(
          controller: _emailController,
          hint: 'Correo electrónico',
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 12),
 
        // Campo de contraseña (con toggle de visibilidad)
        _buildTextField(
          controller: _passwordController,
          hint: 'Contraseña',
          icon: Icons.lock_outline,
          obscureText: !_passwordVisible, // oculta el texto si es true
          suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: AppColors.textHint,
              size: 18,
            ),
            onPressed: () {
              // Alternamos la visibilidad con setState
              setState(() => _passwordVisible = !_passwordVisible);
            },
          ),
        ),
 
        // Mensaje de error
        if (_errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(_errorMessage, style: AppTextStyles.errorText),
          ),
      ],
    );
  }
 
  // TextField reutilizable
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: AppTextStyles.inputText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.inputHint,
        prefixIcon: Icon(icon, color: AppColors.textHint, size: 18),
        suffixIcon: suffixIcon,
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
 
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity, // ocupa todo el ancho disponible
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0, // sin sombra
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Iniciar sesión', style: AppTextStyles.buttonPrimary),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Color(0xFFE8F5EC), size: 16),
          ],
        ),
      ),
    );
  }
 
  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: AppColors.border, thickness: 0.5)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('o', style: AppTextStyles.footer),
        ),
        Expanded(child: Divider(color: AppColors.border, thickness: 0.5)),
      ],
    );
  }
 
  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: widget.onRegister,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13),
          side: const BorderSide(color: AppColors.borderInput, width: 0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_add_outlined, color: AppColors.primaryLight, size: 16),
            const SizedBox(width: 8),
            Text('Crear cuenta nueva', style: AppTextStyles.buttonSecondary),
          ],
        ),
      ),
    );
  }
 
  Widget _buildFooter() {
    return Center(
      child: GestureDetector(
        // GestureDetector: detecta toques en cualquier widget
        onTap: () {
          // Aquí iría la navegación a recuperar contraseña
          debugPrint('Recuperar contraseña');
        },
        child: RichText(
          text: TextSpan(
            style: AppTextStyles.footer,
            children: [
              const TextSpan(text: '¿Olvidaste tu contraseña? '),
              TextSpan(text: 'Recupérala aquí', style: AppTextStyles.footerLink),
            ],
          ),
        ),
      ),
    );
  }
}
