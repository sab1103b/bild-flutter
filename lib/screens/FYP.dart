import 'package:flutter/material.dart';

class Fyp extends StatelessWidget {
  const Fyp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definir colores: vinotinto y beige
    final Color vinotintoClaro = Color(0xFFB3001B); // Vinotinto claro
    final Color vinotintoOscuro = Color(0xFF660000); // Vinotinto oscuro
    final Color beigeClaro = Color(0xFFF5F5DC); // Beige claro

    return Scaffold(
      // Fondo beige claro
      body: Container(
        decoration: BoxDecoration(
          color: beigeClaro, // Fondo beige
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título de la pantalla con vinotinto
              Text(
                'FYP Screen',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: vinotintoOscuro, // Título en vinotinto oscuro
                ),
              ),
              SizedBox(height: 20.0),
              // Botón para regresar, con fondo vinotinto y texto blanco
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: vinotintoOscuro, // Fondo vinotinto oscuro para el botón
                  foregroundColor : Colors.white, // Texto blanco
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Back to Home',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Texto blanco
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
