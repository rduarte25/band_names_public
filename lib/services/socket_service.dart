import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;

  IO.Socket? _socket;

  ServerStatus get serverStatus => this._serverStatus;

  IO.Socket get socket => this._socket!;

  ServerSocket() {
    this._initConfig();
  }

  void _initConfig() {
    //Dart client
    this._socket = IO.io('http://localhost:3000/', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    this._socket!.on('connect', (_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket!.on('disconnect', (_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // _socket.on('new-message', (payload) {
    //   print('new message: ${payload}');
    //   print('name: ${payload['name']}');
    //   print('message: ${payload['message']}');
    //   print(payload.constainsKey('message2') ? payload['message2'] : '');
    // });
  }
}
