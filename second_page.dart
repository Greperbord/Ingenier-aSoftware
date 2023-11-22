import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Registro para Ventas y Eventos',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0,
                      color: Colors.pinkAccent),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: new Image(
                            width: 70.0,
                            height: 70.0,
                            image: new AssetImage('assets/images/registro_sin.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Correo", icon: Icon(Icons.email)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Contraseña", icon: Icon(Icons.password)),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,              
                    children: [     
                      CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Text('Iniciar Sesion'), onPressed: (){}),
                        SizedBox(width: 15,),    
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Text('Cancelar'), onPressed: (){})
                    ],
                    ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}



