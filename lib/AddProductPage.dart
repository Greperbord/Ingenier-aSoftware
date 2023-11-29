import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Producto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              // Los TextFormField para ingresar detalles del producto
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del Producto'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL de la Imagen del Producto'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción del Producto'),
                maxLines: 3,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Precio del Producto'),
              ), 
              TextFormField(
                decoration: InputDecoration(labelText: 'Marca del Producto'),
              ), 
              TextFormField(
                decoration: InputDecoration(labelText: 'Stock del Producto'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ubicacion Del Puesto'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del Estudiante que vende'),
              ),
              SizedBox(height: 20),
              // El botón de guardar con márgenes para ajustar su posición
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'titulo': 'Titulo Ingresado',
                      'urlImagen': 'URL ingresada',
                      'Descripcion': 'Descripcion ingresada',
                      'Precio': 'Precio Ingresado',
                    });
                  },
                  child: Text('Guardar Evento'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
