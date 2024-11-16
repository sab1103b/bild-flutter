import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
     // Define los colores principales
    final Color vinotinto = Color(490808);
    final Color beigeClaro = Color(0xFFF5F5DC);
    
       return Scaffold(
      backgroundColor: vinotinto, // Fondo vinotinto
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título central con color beige y mayor tamaño
              Text(
                'BIND',
                style: TextStyle(
                  fontSize: 64.0, // Título más grande
                  fontWeight: FontWeight.bold, // Negrita
                  color: beigeClaro, // Título en color beige
                ),
              ),
              SizedBox(height: 16.0),
              // Línea separadora
              Container(
                width: 150.0, // Ancho más corto que el título
                height: 2.0,
                color: beigeClaro, // Línea de color beige
              ),
              SizedBox(height: 32.0),
              // Contenedor para inputs más pequeño
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: beigeClaro, // Fondo beige
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
                    // Campo de usuario con icono de vinotinto
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
                    // Campo de contraseña con icono de vinotinto
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
              // Texto de cambio de contraseña con color blanco
              TextButton(
                onPressed: () {
                  // Aquí iría la navegación al cambio de contraseña
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Colors.white, // Texto blanco
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Botón de ingreso con fondo beige y texto vinotinto
              ElevatedButton(
                onPressed: () {
                  // Redirecciona a FYP
                  Navigator.pushNamed(context, '/fyp');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: beigeClaro, // Fondo beige
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: vinotinto, // Texto vinotinto
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}