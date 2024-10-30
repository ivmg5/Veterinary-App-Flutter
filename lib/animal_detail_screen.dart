import 'package:flutter/material.dart';

class AnimalDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recibir los datos del animal desde los argumentos
    final Map<String, dynamic> animal =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(animal['name'] ?? 'Detalle del Animal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            Text(
              animal['name'] ?? 'Sin Nombre',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Edad: ${animal['age'] ?? 'Desconocida'}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            animal['pictureUrl'] != null && animal['pictureUrl'].isNotEmpty
                ? Image.network(
                    animal['pictureUrl'],
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Text('No hay imagen disponible'),
          ],
        ),
      ),
    );
  }
}
