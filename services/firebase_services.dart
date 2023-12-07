import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Consulta para llamar la base de producto a vender

Future<List> getproducto() async {
  List Producto = [];
  CollectionReference collectionReferenceProducto = db.collection('Producto');

  QuerySnapshot queryProducto = await collectionReferenceProducto.get();

  queryProducto.docs.forEach((documento) {
    Producto.add(documento.data());
  });

  return Producto;
}

//Consulta para llamar la base de evento
Future<List> getevento() async {
  List Evento = [];
  CollectionReference collectionReferenceProducto = db.collection('Evento');

  QuerySnapshot queryEvento = await collectionReferenceProducto.get();

  queryEvento.docs.forEach((documento) {
    Evento.add(documento.data());
  });

  return Evento;
}
