import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  // No necesitas pasar 'navigation' como parámetro en Flutter,
  // ya que puedes acceder al Navigator a través del contexto.

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Variables de estado para el correo y la contraseña
  String email = '';
  String password = '';

  // Función para manejar el registro de usuario
  void handleSignUp() async {
    print('Proceso de registro iniciado');
    print('Email: $email');
    print('Password: $password');

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Usuario creado exitosamente: ${userCredential.user}');
      // Navegar a la pantalla del menú principal
      Navigator.pushNamed(context, '/mainMenu');
    } on FirebaseAuthException catch (error) {
      print('Error durante el registro: $error');

      // Mostrar detalles del error
      print('Código de error: ${error.code}');
      print('Mensaje de error: ${error.message}');

      if (error.code == 'network-request-failed') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error de red'),
            content: Text(
                'No se pudo conectar a la red. Verifica tu conexión a internet.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('No se pudo registrar al usuario.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
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
        title: Text('Registrarse'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Registrarse',
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
                    email = value;
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
                  onPressed: handleSignUp,
                  child: Text('Crear Cuenta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
