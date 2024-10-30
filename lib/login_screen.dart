import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Variables de estado para el correo y la contraseña
  String email = '';
  String password = '';

  // Función para manejar el inicio de sesión
  void handleLogin() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Inicio de sesión exitoso: ${userCredential.user}');
      // Navegar a la pantalla del menú principal
      Navigator.pushNamed(context, '/mainMenu');
    } on FirebaseAuthException catch (error) {
      print('Error durante el inicio de sesión: $error');

      // Mostrar mensaje de error al usuario
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Correo o contraseña incorrectos'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } catch (e) {
      // Para cualquier otra excepción
      print('Ocurrió un error inesperado: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Ha ocurrido un error inesperado.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  // Método build para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20), // Espacio vertical
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  onChanged: (value) => setState(() {
                    email = value.trim();
                  }),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) => setState(() {
                    password = value;
                  }),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: handleLogin,
                  child: Text('Ingresar'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la pantalla de registro
                    Navigator.pushNamed(context, '/signUp');
                  },
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
