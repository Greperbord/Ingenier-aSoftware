import 'package:flutter/material.dart';
import 'package:prueba/pages/second_page.dart';
import 'package:prueba/pages/third_page.dart';
import 'package:prueba/pages/AddProductPage.dart';

void main() {
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
    ThirdPage(),
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
        title: Text('Eventos'),
        actions: _selectedIndex == 0
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addProductPage');
                  },
                  icon: Icon(Icons.add),
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
            icon: Icon(Icons.event, color: Colors.purpleAccent, size: 30.0),
            label: "Eventos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration, color: Colors.pinkAccent, size: 30.0),
            label: "Registro",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.blueAccent, size: 30.0),
            label: "Ventas",
          ),
        ],
      ),
    );
  }
}

Widget card(String titulo, String urlImage, String descripcion) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: 200,
    decoration: BoxDecoration(
      color: Colors.red,
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
                    color: Colors.white,
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
                    color: Colors.white,
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
