import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewAnimalScreen extends StatefulWidget {
  @override
  _NewAnimalScreenState createState() => _NewAnimalScreenState();
}

class _NewAnimalScreenState extends State<NewAnimalScreen> {
  // Controladores para los campos de entrada
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _pictureUrlController = TextEditingController();

  // Función para agregar el animal a Firestore
  void handleAddAnimal() async {
    String name = _nameController.text.trim();
    String age = _ageController.text.trim();
    String pictureUrl = _pictureUrlController.text.trim();

    try {
      await FirebaseFirestore.instance.collection('animals').add({
        'name': name,
        'age': age,
        'pictureUrl': pictureUrl,
      });
      // Mostrar alerta de éxito
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Éxito'),
          content: Text('Animal agregado correctamente'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.of(context).pop(); // Volver a la pantalla anterior
              },
            ),
          ],
        ),
      );
    } catch (error) {
      // Mostrar alerta de error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('No se pudo agregar el animal'),
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

  @override
  void dispose() {
    // Liberar los controladores cuando no se necesiten
    _nameController.dispose();
    _ageController.dispose();
    _pictureUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Nuevo Animal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Edad',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _pictureUrlController,
                  decoration: InputDecoration(
                    labelText: 'URL de la Imagen',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: handleAddAnimal,
                  child: Text('Agregar Animal'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
