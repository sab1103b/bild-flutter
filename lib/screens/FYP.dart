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
        backgroundColor: beigeClaro,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono de notificaciones
            IconButton(
              icon: Icon(Icons.notifications, color: vinotintoOscuro),
              onPressed: () {
                Navigator.pushNamed(context, '/noti');
              },
            ),
            // Icono de chat
            IconButton(
              icon: Icon(Icons.chat, color: vinotintoOscuro),
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
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
      body: Column(
        children: [
          // Publicaciones
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 10; i++)
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
          ),
          // Línea divisora
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              color: vinotintoOscuro,
              thickness: 2.0,
            ),
          ),
          // Menú inferior
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // FYP
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/fyp');
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
                    Navigator.pushNamed(context, '/');
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
                    Navigator.pushNamed(context, '/eventos');
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
                    Navigator.pushNamed(context, '/perfil');
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
    );
  }
}
