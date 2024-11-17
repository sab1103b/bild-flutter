import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  // Datos de usuario simulado
  final String _fullname = "Mauricio Munar";
  final String _nickname = "mauriciomunar";
  final String _email = "mauricio@bind.com";
  final String _phone = "3001234567";
  final String _city = "Bogotá";
  final String _country = "Colombia";
  final String _profileImage = "assets/profile.jpg"; // Imagen de perfil (simulada)

  bool _isEditing = false; // Control para mostrar/ocultar modo edición

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullnameController.text = _fullname;
    _nicknameController.text = _nickname;
    _emailController.text = _email;
    _phoneController.text = _phone;
    _cityController.text = _city;
    _countryController.text = _country;
  }

  @override
  Widget build(BuildContext context) {
    final Color vinotintoClaro = const Color.fromARGB(255, 131, 23, 39);
    final Color vinotintoOscuro = const Color.fromARGB(255, 68, 4, 4);
    final Color beigeClaro = const Color.fromARGB(255, 211, 200, 182);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [vinotintoClaro, vinotintoOscuro],
          ),
        ),
        child: SingleChildScrollView(
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

              // Nombre completo
              _isEditing
                  ? TextField(
                      controller: _fullnameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre completo',
                        prefixIcon: Icon(Icons.person, color: vinotintoOscuro),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                  : Text(
                      _fullname,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: beigeClaro,
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: beigeClaro,
                      ),
                    ),
              const SizedBox(height: 16.0),

              // Correo electrónico
              _isEditing
                  ? TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        prefixIcon: Icon(Icons.email, color: vinotintoOscuro),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                  : Text(
                      _email,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: beigeClaro,
                      ),
                    ),
              const SizedBox(height: 16.0),

              // Teléfono
              _isEditing
                  ? TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: 'Teléfono celular',
                        prefixIcon: Icon(Icons.phone, color: vinotintoOscuro),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                  : Text(
                      _phone,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: beigeClaro,
                      ),
                    ),
              const SizedBox(height: 16.0),

              // Ciudad
              _isEditing
                  ? TextField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: 'Ciudad',
                        prefixIcon: Icon(Icons.location_city, color: vinotintoOscuro),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                  : Text(
                      _city,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: beigeClaro,
                      ),
                    ),
              const SizedBox(height: 16.0),

              // País
              _isEditing
                  ? TextField(
                      controller: _countryController,
                      decoration: InputDecoration(
                        labelText: 'País',
                        prefixIcon: Icon(Icons.flag, color: vinotintoOscuro),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    )
                  : Text(
                      _country,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: beigeClaro,
                      ),
                    ),
              const SizedBox(height: 24.0),

              // Botones de acción
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción de editar perfil
                      setState(() {
                        _isEditing = !_isEditing;  // Cambiar entre modo edición y no edición
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
