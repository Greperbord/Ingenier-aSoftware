import 'package:flutter/material.dart';
import 'package:kk/AddProductPage.dart';



class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            card('Candy', 
                      'https://images.unsplash.com/photo-1582058091505-f87a2e55a40f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      'esto es una descripcion del producto',
                      12.50,
                    ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPage()),
          );
        },
        child: Icon(Icons.add_business),
      ),

    );
  }
}



//Ver list view builder
//Crud Sistema 

Widget card(String titulo,String urlImage, String descripcion, double precio) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 5, right: 5), 
    height: 200,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 193, 241, 173),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Row(
      children: [
        
      Container(
        padding: EdgeInsets.all(10),
         child: Image(image: NetworkImage(urlImage),
            fit: BoxFit.cover,
            height: 180,
            width: 180,
          ),
       ),
       Container(
        child: Column(
          children: [
            const SizedBox(height:10),
            Container(
              width: 150,
              height: 55,
              child: Text(
                titulo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
             Container(
              width: 150,
              height: 100,
              child: Text(
                descripcion,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
             Container(
              width: 150,
              height: 30,
              child: Text(
                '\$ ${precio.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
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