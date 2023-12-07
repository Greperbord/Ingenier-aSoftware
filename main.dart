import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:crud_firebase/pages/second_page.dart';
import 'package:crud_firebase/pages/AddProductPage.dart';

//Impotaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Link de la base de datos con conexion remota
//https://console.firebase.google.com/project/flutter-prueba-a7914/firestore/data/~2FEvento~2F7XUOcXi6ltA38DHHx9Ii?hl=es-419

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba',
      routes: {
        '/': (context) => MyHomePage(),
        '/addProductPage': (context) => AddProductPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Container(
      padding: EdgeInsets.only(top: 20),
      height: 200,
      child: card(
        'Evento',
        'https://images.unsplash.com/photo-1559456751-057ed03f3143?q=80&w=1802&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'descripcion del Evento',
      ),
    ),
    SecondPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos y Ventas'),
        actions: _selectedIndex == 0
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addProductPage');
                  },
                  icon: Icon(Icons.post_add),
                ),
              ]
            : null,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.today,
                color: Color.fromARGB(255, 153, 207, 214), size: 30.0),
            label: "Eventos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall,
                color: Color.fromARGB(255, 193, 241, 173), size: 30.0),
            label: "Ventas",
          ),
        ],
      ),
    );
  }
}

Widget card(String titulo, String urlImage, String descripcion) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
    height: 200,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 153, 207, 214),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Image(
            image: NetworkImage(urlImage),
            fit: BoxFit.cover,
            height: 160,
            width: 160,
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: 140,
                height: 55,
                child: Text(
                  titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Container(
                width: 130,
                height: 90,
                child: Text(
                  descripcion,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
