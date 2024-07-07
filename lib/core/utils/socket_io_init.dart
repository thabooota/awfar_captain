import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'variable_manager.dart';

IO.Socket? socket;

IO.Socket initSocket() {
  socket = IO.io(ApiConstants.socketServerURL, <String, dynamic>{
    'autoConnect': true,
    'transports': ['websocket'],
  });
  socket!.connect();
  socket!.onConnect((_) => print('Connection established'));
  socket!.onDisconnect((_) => print('Connection Disconnection'));
  socket!.onConnectError((err) => print(err));
  socket!.onError((err) => print(err));

  return socket!;
}
