import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
     // Define los colores principales
    final Color vinotinto = Color(0xFF800020);
    final Color beigeClaro = Color(0xFFF5F5DC);
    
    return Scaffold(
      backgroundColor: beigeClaro,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título central
              Text(
                'BIND',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: vinotinto,
                ),
              ),
              SizedBox(height: 32.0),
              // --------------------------------------------------------------------- Contenedor para inputs
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // ----------------------------------------------------------------------- Campo de usuario
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        prefixIcon: Icon(Icons.person, color: vinotinto),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // ----------------------------------------------------------------------- Campo de contraseña
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock, color: vinotinto),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // ----------------------------------------------------------------- Texto de cambio de contraseña
              TextButton(
                onPressed: () {
                  // Aquí iría la navegación al cambio de contraseña
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: vinotinto,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              //----------------------------------------------------------------- Botón de ingreso
              ElevatedButton(
                onPressed: () {
                  // Acción para el botón de ingreso
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: vinotinto, // Color de fondo
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: beigeClaro, // Color del texto
                  ),
                ),
              ),
              SizedBox(height: 32.0),

              // -----------------------------------------------------------------Botones de navegación
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/perfil');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: vinotinto,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Ir a Perfil',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: beigeClaro,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/fyp');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: vinotinto,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Ir a FYP',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: beigeClaro,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}