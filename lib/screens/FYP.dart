import 'package:flutter/material.dart';

class Fyp extends StatelessWidget {
  const Fyp({super.key});

  @override
  Widget build(BuildContext context) {
    // Colores
    final Color vinotintoOscuro = const Color(0xFF660000); // Vinotinto oscuro
    final Color beigeClaro = const Color(0xFFF5F5DC); // Beige claro

    return Scaffold(
      appBar: AppBar(
        backgroundColor: beigeClaro, // Fondo beige para la barra superior
        leading: Row(
          children: [
            // Icono de notificaciones (izquierda)
            IconButton(
              icon: Icon(Icons.notifications, color: vinotintoOscuro),
              onPressed: () {
                // Acción de notificación
              },
            ),
            // Icono de chat (izquierda)
            IconButton(
              icon: Icon(Icons.chat, color: vinotintoOscuro),
              onPressed: () {
                // Acción de chat
              },
            ),
          ],
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'BILD',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: vinotintoOscuro,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sección de publicaciones (en scroll)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Aquí irán las publicaciones dinámicas (Firebase)
                  for (int i = 0; i < 10; i++) 
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          'Publicación $i',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: vinotintoOscuro,
                          ),
                        ),
                        subtitle: Text(
                          'Descripción de la publicación',
                          style: TextStyle(color: vinotintoOscuro),
                        ),
                        trailing: Icon(Icons.favorite_border, color: vinotintoOscuro),
                      ),
                    ),
                ],
              ),
            ),
            // Línea con las 4 opciones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                color: vinotintoOscuro,
                thickness: 2.0,
              ),
            ),
            // Opciones en la parte inferior
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // FYP
                  GestureDetector(
                    onTap: () {
                      // Acción para FYP
                    },
                    child: Column(
                      children: [
                        Icon(Icons.home, color: vinotintoOscuro),
                        Text('FYP', style: TextStyle(color: vinotintoOscuro)),
                      ],
                    ),
                  ),
                  // Búsqueda
                  GestureDetector(
                    onTap: () {
                      // Acción para Búsqueda
                    },
                    child: Column(
                      children: [
                        Icon(Icons.search, color: vinotintoOscuro),
                        Text('Búsqueda', style: TextStyle(color: vinotintoOscuro)),
                      ],
                    ),
                  ),
                  // Eventos
                  GestureDetector(
                    onTap: () {
                      // Acción para Eventos
                    },
                    child: Column(
                      children: [
                        Icon(Icons.event, color: vinotintoOscuro),
                        Text('Eventos', style: TextStyle(color: vinotintoOscuro)),
                      ],
                    ),
                  ),
                  // Perfil
                  GestureDetector(
                    onTap: () {
                      // Acción para Perfil
                    },
                    child: Column(
                      children: [
                        Icon(Icons.account_circle, color: vinotintoOscuro),
                        Text('Perfil', style: TextStyle(color: vinotintoOscuro)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
