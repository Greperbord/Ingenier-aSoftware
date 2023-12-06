import 'package:flutter/material.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Título del Evento'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'URL de la Imagen'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'titulo': 'Titulo Ingresado',
                  'urlImagen': 'URL ingresada',
                  'Descripcion': 'Descripcion ingresada',
                });
              },
              child: Text('Guardar Evento'),
            ),
          ],
        ),
      ),
    );
  }
}
