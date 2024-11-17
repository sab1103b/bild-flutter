import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    final Color vinotintoClaro = const Color.fromARGB(255, 131, 23, 39);
    final Color beigeClaro = const Color.fromARGB(255, 211, 200, 182);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: vinotintoClaro,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Aquí se puede agregar la acción para ir a configuración
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen de perfil
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Reemplaza con la URL de la imagen de perfil
              ),
            ),
            
            // Información del usuario
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Text(
                    'UsuarioEjemplo', // Aquí se debería mostrar el nickname o nombre del usuario
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Nombre Completo', // Nombre completo del usuario
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Aquí va una breve biografía del usuario. Este es un ejemplo de texto.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Botones de interacción (Ejemplo: Editar perfil, Seguir)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Aquí iría la acción de seguir o dejar de seguir
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: vinotintoClaro,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                    ),
                    child: Text('Seguir'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Acción de editar perfil
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: beigeClaro,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                    ),
                    child: Text('Editar'),
                  ),
                ],
              ),
            ),
            
            // Galería de fotos (Grid de imágenes)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,  // Para que la cuadrícula se adapte al contenido
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,  // Tres imágenes por fila
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 9,  // Número de fotos
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300], // Placeholder para las imágenes
                    child: Image.network('https://via.placeholder.com/150', fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
