//Paquetes de flutter
import 'package:flutter/material.dart';

//Paquetes de terceros


//Paquetes propios
import 'package:band_names/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material APP',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomePage()
      },
    );
  }
}
