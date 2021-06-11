import 'package:flutter/material.dart';

//terceros

//Propios
import 'package:band_names/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
    Listado de bandas a manera de pruebas
  */
  List<Band> bands = [
    Band(id: '1', name: 'Metalica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 2),
    Band(id: '3', name: 'Héroes del Silencio', votes: 1),
    Band(id: '4', name: 'Bon Jovi', votes: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Band Names',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            _bandTile(bands[index]),
        itemCount: bands.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand,
      ),
    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(band.name!.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      title: Text(band.name!),
      trailing: Text(
        '${band.votes!}',
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        print(band.name!);
      },
    );
  }

  /* Método para añadir una nueva banda */
  addNewBand() {
    final TextEditingController textController = new TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New band name'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text('Add'),
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () {
                    print( textController.text );
                  })
            ],
          );
        });
  }
}
