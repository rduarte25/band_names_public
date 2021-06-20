//Paquetes del lenguaje
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Paquetes propios
import 'package:band_names/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ServerStatus: ${ socketService.serverStatus }'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {  },
      ),
    );
  }
}
