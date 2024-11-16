import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  // Controlador de texto para la contraseña
  final TextEditingController _passwordController = TextEditingController();
  // Estado para saber si la contraseña está visible o no
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    // Define los colores vinotinto claro y oscuro, y beige
    final Color vinotintoClaro = const Color.fromARGB(255, 131, 23, 39); // Vinotinto claro
    final Color vinotintoOscuro = const Color.fromARGB(255, 68, 4, 4); // Vinotinto oscuro
    final Color beigeClaro = const Color.fromARGB(255, 211, 200, 182); // Beige claro

    return Scaffold(
      // Fondo con gradiente de vinotinto claro a oscuro
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [vinotintoClaro, vinotintoOscuro], // Gradiente de vinotinto
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título central con color beige, más grande y en negrita
                Text(
                  'BIND',
                  style: TextStyle(
                    fontSize: 72.0, // Aumentado el tamaño del título
                    fontWeight: FontWeight.bold, // Más negrita
                    color: beigeClaro, // Título en beige
                  ),
                ),
                const SizedBox(height: 8.0), // Menos espacio entre el título y la línea
                // Línea separadora más cerca del título
                Container(
                  width: 180.0, // Ancho más corto que el título
                  height: 2.0,
                  color: beigeClaro, // Línea de color beige
                ),
                const SizedBox(height: 32.0),
                // Contenedor para inputs más pequeño, con fondo beige
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: beigeClaro, // Fondo beige
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
                      // Campo de usuario con icono de vinotinto
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          prefixIcon: Icon(Icons.person, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Campo de contraseña con opción de ver/ocultar
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword, // Si está true, oculta la contraseña
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
                                _obscurePassword = !_obscurePassword; // Alternar visibilidad
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
                // Texto "Olvidaste tu contraseña" a la derecha con fuente light
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Aquí iría la navegación al cambio de contraseña
                    },
                    child: Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: beigeClaro, // Texto beige
                        fontWeight: FontWeight.w300, // Fuente más ligera
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Línea separadora más larga
                Container(
                  width: 250.0, // Línea más larga
                  height: 2.0,
                  color: beigeClaro, // Línea de color beige
                ),
                const SizedBox(height: 16.0),
                // Texto "Registrar nuevo usuario"
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Crear');
                  },
                  child: Text(
                    'Registrar nuevo usuario',
                    style: TextStyle(
                      color: beigeClaro, // Texto en beige
                      fontWeight: FontWeight.normal, // Fuente normal
                      fontSize: 16.0, // Tamaño de texto
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Botón de ingreso con fondo beige y texto vinotinto
                ElevatedButton(
                  onPressed: () {
                    // Redirecciona a FYP
                    Navigator.pushNamed(context, '/fyp');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: beigeClaro, // Fondo beige
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: vinotintoOscuro, // Texto vinotinto oscuro
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
