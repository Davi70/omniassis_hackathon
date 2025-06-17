import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nombreController = TextEditingController();
  final passwordController = TextEditingController();
  String? rolSeleccionado;

  void login() {
    if (rolSeleccionado == "concesion") {
      Navigator.pushNamed(context, '/concesion');
    } else if (rolSeleccionado == "usuario") {
      Navigator.pushNamed(context, '/usuario');
    } else if (rolSeleccionado == "operador") {
      Navigator.pushNamed(context, '/operador');
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selecciona un rol válido')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1f4037), Color(0xFF99f2c8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 10),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Iniciar Sesión",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nombreController,
                  decoration: InputDecoration(
                    hintText: "Nombre",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  hint: const Text("Selecciona tu rol"),
                  value: rolSeleccionado,
                  onChanged: (value) => setState(() => rolSeleccionado = value),
                  items: const [
                    DropdownMenuItem(
                      value: "concesion",
                      child: Text("Concesión"),
                    ),
                    DropdownMenuItem(
                      value: "usuario",
                      child: Text("Usuario Común"),
                    ),
                    DropdownMenuItem(
                      value: "operador",
                      child: Text("Operador"),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: login,
                  child: const Text(
                    "Ingresar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/registro'),
                  child: const Text("¿No tienes cuenta? Regístrate"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
