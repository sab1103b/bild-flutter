import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Datos de usuario registrados
  final String registeredNickname = "usuarioEjemplo"; // Nickname predefinido
  final String registeredPassword = "Contraseña123!"; // Contraseña predefinida

  bool _obscurePassword = true; // Control para visibilidad de la contraseña

  @override
  Widget build(BuildContext context) {
    final Color vinotintoClaro = const Color.fromARGB(255, 131, 23, 39);
    final Color vinotintoOscuro = const Color.fromARGB(255, 68, 4, 4);
    final Color beigeClaro = const Color.fromARGB(255, 211, 200, 182);

    return Scaffold(
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
                Text(
                  'BIND',
                  style: TextStyle(
                    fontSize: 72.0,
                    fontWeight: FontWeight.bold,
                    color: beigeClaro,
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: 180.0,
                  height: 2.0,
                  color: beigeClaro,
                ),
                const SizedBox(height: 32.0),
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
                      // Campo de nickname
                      TextField(
                        controller: _nicknameController,
                        decoration: InputDecoration(
                          labelText: 'Nickname',
                          prefixIcon: Icon(Icons.person, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Campo de contraseña con visibilidad controlada
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock, color: vinotintoOscuro),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: vinotintoOscuro,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Aquí va la navegación al cambio de contraseña
                    },
                    child: Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: beigeClaro,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: 250.0,
                  height: 2.0,
                  color: beigeClaro,
                ),
                const SizedBox(height: 16.0),
                // Botón de "Registrar nuevo usuario"
                TextButton(
                  onPressed: () {
                    // Redirige a la pantalla de crear usuario
                    Navigator.pushNamed(context, '/Crear');
                  },
                  child: Text(
                    'Registrar nuevo usuario',
                    style: TextStyle(
                      color: beigeClaro,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Verifica si los datos coinciden con los del usuario registrado
                    if (_nicknameController.text == registeredNickname &&
                        _passwordController.text == registeredPassword) {
                      Navigator.pushNamed(context, '/fyp');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Nickname o contraseña incorrectos'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: beigeClaro,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: vinotintoOscuro,
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
