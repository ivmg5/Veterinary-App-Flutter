import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Referencia a la colección 'animals' en Firestore
    CollectionReference animalsCollection =
        FirebaseFirestore.instance.collection('animals');

    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Widget expandido para llenar el espacio disponible
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: animalsCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error al obtener los datos'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final animals = snapshot.data!.docs;

                  if (animals.isEmpty) {
                    return Center(child: Text('No hay animales disponibles'));
                  }

                  return ListView.builder(
                    itemCount: animals.length,
                    itemBuilder: (context, index) {
                      final doc = animals[index];
                      final data = doc.data() as Map<String, dynamic>;
                      data['id'] = doc.id; // Agregar el ID del documento

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: Material(
                          color: Color(0xFFF9C2FF), // Color de fondo equivalente a '#f9c2ff'
                          child: InkWell(
                            onTap: () {
                              // Navegar a la pantalla de detalles del animal
                              Navigator.pushNamed(
                                context,
                                '/animalDetail',
                                arguments: data,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                data['name'] ?? 'Sin Nombre',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla para agregar un nuevo animal
                Navigator.pushNamed(context, '/newAnimal');
              },
              child: Text('Agregar Animal'),
            ),
          ],
        ),
      ),
    );
  }
}
