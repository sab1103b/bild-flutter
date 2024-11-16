import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para los formateadores de texto

class Crearusuario extends StatefulWidget {
  const Crearusuario({super.key});

  @override
  State<Crearusuario> createState() => _CrearusuarioState();
}

class _CrearusuarioState extends State<Crearusuario> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _selectedCountry;
  String? _selectedCity;

  bool _obscurePassword = true; // Estado para la visibilidad de la contraseña

  final List<String> _countries = ['Colombia', 'México', 'Argentina', 'Chile'];
  final Map<String, List<String>> _cities = {
    'Colombia': ['Bogotá', 'Medellín', 'Cali'],
    'México': ['CDMX', 'Guadalajara', 'Monterrey'],
    'Argentina': ['Buenos Aires', 'Córdoba', 'Rosario'],
    'Chile': ['Santiago', 'Valparaíso', 'Concepción'],
  };

  // Expresión regular para validar la contraseña
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$',
  );

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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registro',
                  style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: beigeClaro,
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: beigeClaro,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Campo para nombre completo (solo letras)
                      TextField(
                        controller: _fullnameController,
                        decoration: InputDecoration(
                          labelText: 'Nombre completo',
                          prefixIcon: Icon(Icons.person, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')), // Solo letras y espacios
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      // Campo para nickname deseado
                      TextField(
                        controller: _nicknameController,
                        decoration: InputDecoration(
                          labelText: 'Nickname',
                          prefixIcon: Icon(Icons.tag_faces, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Campo para correo electrónico
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          prefixIcon: Icon(Icons.email, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Campo para contraseña con validación de seguridad
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword, // Control de visibilidad
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock, color: vinotintoOscuro),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: vinotintoOscuro,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword; // Alternar visibilidad
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r' ')), // Prohibir espacios en la contraseña
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      // Mensaje de validación de la contraseña
                      Text(
                        'La contraseña debe tener entre 8 y 15 caracteres, incluir mayúsculas, minúsculas, números y caracteres especiales.',
                        style: TextStyle(
                          color: vinotintoOscuro,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // Selector de país
                      DropdownButtonFormField<String>(
                        value: _selectedCountry,
                        onChanged: (value) {
                          setState(() {
                            _selectedCountry = value;
                            _selectedCity = null; // Resetear ciudad cuando se cambie el país
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'País',
                          prefixIcon: Icon(Icons.flag, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        items: _countries.map((String country) {
                          return DropdownMenuItem<String>(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16.0),
                      // Selector de ciudad
                      if (_selectedCountry != null)
                        DropdownButtonFormField<String>(
                          value: _selectedCity,
                          onChanged: (value) {
                            setState(() {
                              _selectedCity = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Ciudad',
                            prefixIcon: Icon(Icons.location_city, color: vinotintoOscuro),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          items: _selectedCountry != null
                              ? _cities[_selectedCountry]!.map((String city) {
                                  return DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  );
                                }).toList()
                              : [],
                        ),
                      const SizedBox(height: 16.0),
                      // Campo para teléfono celular (solo números)
                      TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          labelText: 'Teléfono celular',
                          prefixIcon: Icon(Icons.phone, color: vinotintoOscuro),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Solo números
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    final fullname = _fullnameController.text;
                    final nickname = _nicknameController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    final phone = _phoneController.text;
                    final country = _selectedCountry;
                    final city = _selectedCity;

                    // Validar la contraseña
                    if (!_passwordRegExp.hasMatch(password)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('La contraseña no cumple con los requisitos'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (fullname.isNotEmpty &&
                        nickname.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty &&
                        phone.isNotEmpty &&
                        country != null &&
                        city != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Usuario registrado con éxito'),
                          backgroundColor: vinotintoClaro,
                        ),
                      );
                      Navigator.pop(context); // Regresa al login
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Por favor complete todos los campos'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: beigeClaro,
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Registrar',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: vinotintoOscuro,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Regresa al inicio
                  },
                  child: Text(
                    'Volver al inicio',
                    style: TextStyle(
                      color: beigeClaro,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
