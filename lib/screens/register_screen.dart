import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  String? rolSeleccionado;

  void registrar() {
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
            colors: [Color(0xFF8360c3), Color(0xFF2ebf91)],
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
                  "Registro",
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
                  controller: correoController,
                  decoration: InputDecoration(
                    hintText: "Correo electrónico",
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
                    backgroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: registrar,
                  child: const Text(
                    "Registrarse",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("¿Ya tienes cuenta? Inicia sesión"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
