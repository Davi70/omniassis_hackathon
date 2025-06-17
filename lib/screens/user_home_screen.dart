import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController origenCtrl = TextEditingController();
    final TextEditingController destinoCtrl = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                color: const Color(0xFF1f2937),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Transporte público inteligente y seguro",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: origenCtrl,
                    decoration: _inputDecoration("Origen"),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: destinoCtrl,
                    decoration: _inputDecoration("Destino"),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // mostrar rutas
                    },
                    style: _btnStyle(),
                    child: const Text("✈ Buscar ruta"),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _mostrarPagoNFC(context),
                          style: _btnStyle(),
                          child: const Text("Pago NFC"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _mostrarAlerta(
                            context,
                            "Simulando escaneo de código QR",
                          ),
                          style: _btnStyle(),
                          child: const Text("Escanear QR"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _infoBox(),
                  const SizedBox(height: 20),
                  _rutaSimulada(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Text("SOS", style: TextStyle(color: Colors.white)),
        onPressed: () {
          _mostrarAlerta(
            context,
            "⚠️ ALERTA ENVIADA\nAutoridades locales han sido notificadas.",
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) => InputDecoration(
    hintText: hint,
    filled: true,
    fillColor: const Color(0xFF374151),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    hintStyle: const TextStyle(color: Colors.white70),
  );

  ButtonStyle _btnStyle() => ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF3b82f6),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 14),
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  );

  void _mostrarPagoNFC(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1f2937),
        title: const Text("Pago NFC", style: TextStyle(color: Colors.white)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Toca para activar el pago NFC",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text("Tarifa: \$2.50", style: TextStyle(color: Colors.greenAccent)),
            SizedBox(height: 10),
            Text(
              "Mantén tu dispositivo cerca del lector",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cerrar",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  void _mostrarAlerta(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Aviso"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget _infoBox() => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFF374151),
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "🔎 Análisis de Seguridad",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text("Seguridad promedio: ", style: TextStyle(color: Colors.redAccent)),
        Text(
          "⏰ Hora pico: Mayor vigilancia en rutas principales",
          style: TextStyle(color: Colors.white70),
        ),
        Text(
          "🤖 Inteligencia colectiva: 318 usuarios reportando",
          style: TextStyle(color: Colors.white70),
        ),
        Text(
          "⚠️ Alertas activas: Sin incidentes reportados",
          style: TextStyle(color: Colors.white70),
        ),
        SizedBox(height: 4),
        Text(
          "Datos actualizados hace 2 minutos",
          style: TextStyle(color: Colors.greenAccent),
        ),
      ],
    ),
  );

  Widget _rutaSimulada() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "🚌 Rutas cercanas",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      const SizedBox(height: 8),
      _rutaItem("RUTA 5 Línea Central", "64.4%", Colors.orange),
      _rutaItem(
        "RUTA 1",
        "88.9%",
        Colors.yellow,
        extra: "Ruta más rápida y conveniente ☑☑",
      ),
      _rutaItem("RUTA 7 Franja Verde", "92.5%", Colors.green),
    ],
  );

  Widget _rutaItem(
    String title,
    String seguridad,
    Color color, {
    String? extra,
  }) => Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: const Color(0xFF1f2937),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text("Seguridad: $seguridad", style: TextStyle(color: color)),
        const Text(
          "Llegada: 8 min (150m), 3 paradas",
          style: TextStyle(color: Colors.white70),
        ),
        if (extra != null)
          Text(extra, style: const TextStyle(color: Colors.white70)),
      ],
    ),
  );
}
