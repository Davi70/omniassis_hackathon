import 'package:flutter/material.dart';

class OperadorScreen extends StatelessWidget {
  const OperadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 30),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🛠️', style: TextStyle(fontSize: 50)),
                const SizedBox(height: 15),
                const Text(
                  '¡Bienvenido, Operador!',
                  style: TextStyle(fontSize: 24, color: Color(0xFF00d4ff)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Has iniciado sesión correctamente como operador del sistema.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _menuButton(context, '📋 Ver rutas asignadas'),
                _menuButton(context, '✅ Confirmar llegadas'),
                _menuButton(context, '📊 Reportes del día'),
                _menuButton(context, '🔒 Cerrar sesión', isLogout: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuButton(
    BuildContext context,
    String text, {
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          if (isLogout) Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00d4ff),
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
