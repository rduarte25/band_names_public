//Paquetes de flutter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Paquetes de terceros


//Paquetes propios
import 'package:band_names/pages/home.dart';
import 'package:band_names/pages/status.dart';
import 'package:band_names/services/socket_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => SocketService() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material APP',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => HomePage(),
          'status': ( _ ) => StatusPage()
        },
      )
    );
  }
}
