import 'package:flutter/material.dart';

class Crearusuario extends StatefulWidget {
  const Crearusuario({super.key});

  @override
  State<Crearusuario> createState() => _CrearusuarioState();
}

class _CrearusuarioState extends State<Crearusuario> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Define colores vinotinto y beige para mantener la coherencia con el diseño.
    final Color vinotintoClaro = const Color.fromARGB(255, 131, 23, 39);
    final Color vinotintoOscuro = const Color.fromARGB(255, 68, 4, 4);
    final Color beigeClaro = const Color.fromARGB(255, 211, 200, 182);

    return Scaffold(
      // Fondo con gradiente vinotinto
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [vinotintoClaro, vinotintoOscuro],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título de la pantalla
                Text(
                  'Registro',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: beigeClaro,
                  ),
                ),
                const SizedBox(height: 16.0),
                // Contenedor con campos de entrada
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: beigeClaro,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Campo de texto para nombre de usuario
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Nombre de usuario',
                          prefixIcon: Icon(Icons.person, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Campo de texto para email
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: Icon(Icons.email, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Campo de texto para contraseña
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                // Botón de registrar
                ElevatedButton(
                  onPressed: () {
                    // Aquí agregarías la lógica para registrar al usuario.
                    final username = _usernameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    if (username.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Usuario $username registrado con éxito'),
                          backgroundColor: vinotintoClaro,
                        ),
                      );
                      Navigator.pop(context); // Regresa al login
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Por favor, complete todos los campos'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: beigeClaro,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Registrar',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: vinotintoOscuro,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Botón para regresar al login
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Volver al inicio',
                    style: TextStyle(
                      color: beigeClaro,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
