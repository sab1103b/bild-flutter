import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final Color vinotintoOscuro = const Color(0xFF660000);
    final Color beigeClaro = const Color(0xFFF5F5DC);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF660000), Color(0xFF330000)], // Gradiente vinotinto
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título BIND
              Column(
                children: [
                  Text(
                    'BIND',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: beigeClaro,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 150,
                    height: 2,
                    color: beigeClaro,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Contenedor con usuario y contraseña
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: beigeClaro,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        labelStyle: TextStyle(color: vinotintoOscuro),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: vinotintoOscuro),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Olvidaste tu contraseña
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: beigeClaro,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              // Botón de Ingreso
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: beigeClaro,
                  foregroundColor: vinotintoOscuro,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/fyp');
                },
                child: const Text('Ingresar'),
              ),
              const SizedBox(height: 20),
              // Línea divisoria
              Container(
                width: 200,
                height: 2,
                color: beigeClaro,
              ),
              const SizedBox(height: 10),
              // Registrar nuevo usuario
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Crear');
                },
                child: Text(
                  'Registrar nuevo usuario',
                  style: TextStyle(
                    color: beigeClaro,
                    fontWeight: FontWeight.w300,
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