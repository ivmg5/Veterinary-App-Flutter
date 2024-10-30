import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'main_menu_screen.dart';
import 'new_animal_screen.dart';
import 'animal_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinary App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/mainMenu': (context) => MainMenuScreen(),
        '/newAnimal': (context) => NewAnimalScreen(),
        '/animalDetail': (context) => AnimalDetailScreen(),
      },
    );
  }
}
