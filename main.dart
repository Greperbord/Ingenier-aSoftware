import 'package:flutter/material.dart';
import 'package:prueba/pages/primera.dart';
import 'package:prueba/pages/segunda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba',
      home: const MyHomePage(),
      
    ); 
  }
}

//Sirve para cambiar el estado, mas que nada para objetos que van cambiando
//con el tiempo de ejecucion 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //Nos dice el valor
    //de la pantalla

    Widget? child;

    child: 
    switch(indice){
      case 0:
        child: FlutterLogo();
        break;
      case 1:
        child: MaterialApp(
          debugShowCheckedModeBanner: false, home: new FirstPage()
        );
        break;
      case 2:
        child: MaterialApp(
          debugShowCheckedModeBanner: false, home: new SecondPage()
        );        
        break;
    }


    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(()=> indice = newIndex),
        currentIndex: indice,
        items: [
          BottomNavigationBarItem(icon: Icon(
            Icons.home,
            color: Colors.purpleAccent,
            size: 30.0,
          ),
          label: "Menu Principal"
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.event,
            color: Colors.pinkAccent,
            size: 30.0,
          ),
          label: "Eventos"
          ),
          BottomNavigationBarItem(icon: Icon(
            Icons.shopping_bag,
            color: Colors.blueAccent,
            size: 30.0,
          ),
          label: "Ventas"
          )

        ]
        ),
        
    );
  }
}
