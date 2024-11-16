import 'package:flutter/material.dart';
class Fyp extends StatefulWidget {
  const Fyp({super.key});

  @override
  State<Fyp> createState() => _FypState();
}

class _FypState extends State<Fyp> {
  // Lista que almacena el conteo de likes para cada publicación
  final List<int> _likes = List<int>.generate(5, (index) => 0); // Inicializa con 0 likes por publicación
  final Color vinotintoOscuro = const Color(0xFF660000);
  final Color beigeClaro = const Color(0xFFF5F5DC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: beigeClaro,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.notifications, color: vinotintoOscuro),
              onPressed: () {
                Navigator.pushNamed(context, '/noti');
              },
            ),
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
                children: List.generate(5, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Encabezado de la publicación
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: vinotintoOscuro,
                              child: Text(
                                'U${index + 1}',
                                style: TextStyle(color: beigeClaro),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Usuario ${index + 1}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: vinotintoOscuro,
                                ),
                              ),
                            ),
                            Icon(Icons.more_vert, color: vinotintoOscuro),
                          ],
                        ),
                      ),
                      // Imagen principal
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        height: 250.0,
                        decoration: BoxDecoration(
                          color: vinotintoOscuro,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/placeholder.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Interacciones
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    color: _likes[index] > 0
                                        ? Colors.red
                                        : vinotintoOscuro,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _likes[index]++;
                                    });
                                  },
                                ),
                                Text(
                                  '${_likes[index]} likes',
                                  style: TextStyle(
                                    color: vinotintoOscuro,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.comment_outlined,
                                  color: vinotintoOscuro),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.share_outlined,
                                  color: vinotintoOscuro),
                              onPressed: () {},
                            ),
                            Icon(Icons.bookmark_border, color: vinotintoOscuro),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1.0),
                    ],
                  );
                }),
              ),
            ),
          ),
          // Menú inferior
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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