import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<Perfil> {
  String _nickname = "mauriciomunar"; // Nickname del usuario
  String _profileImage = "assets/profile.jpg"; // Imagen de perfil del usuario
  List<String> _userPhotos = [
    "assets/photo1.jpg",
    "assets/photo2.jpg",
    "assets/photo3.jpg"
  ]; // Fotos subidas por el usuario

  bool _isEditing = false; // Control para mostrar/ocultar modo edición
  final TextEditingController _nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nicknameController.text = _nickname;
  }

  @override
  Widget build(BuildContext context) {
    final Color vinotintoOscuro = const Color(0xFF660000);
    final Color beigeClaro = const Color(0xFFF5F5DC);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: beigeClaro,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Perfil',
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
          // Sección de fondo con gradiente y contenido del perfil
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [vinotintoOscuro, beigeClaro],
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Imagen de perfil
                Center(
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage(_profileImage),
                  ),
                ),
                const SizedBox(height: 16.0),

                // Nickname
                _isEditing
                    ? TextField(
                        controller: _nicknameController,
                        decoration: InputDecoration(
                          labelText: 'Nickname',
                          prefixIcon: Icon(Icons.tag_faces, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      )
                    : Text(
                        _nickname,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: beigeClaro,
                        ),
                      ),
                const SizedBox(height: 16.0),

                // Botón de acción: Editar perfil / Guardar cambios
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = !_isEditing; // Cambiar entre modo edición y no edición
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: beigeClaro,
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
                  ),
                  child: Text(
                    _isEditing ? 'Guardar cambios' : 'Editar perfil',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: vinotintoOscuro,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
          
          // Sección de fotos subidas debajo del fondo rojo
          Container(
            padding: const EdgeInsets.all(16.0),
            child: _userPhotos.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fotos subidas',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: beigeClaro,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: _userPhotos.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              _userPhotos[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                : Text(
                    'No has subido fotos aún.',
                    style: TextStyle(color: beigeClaro),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
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
    );
  }
}
