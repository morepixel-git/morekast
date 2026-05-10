// Snapcast JSON-RPC Service pour MoreKast

import 'dart:convert';
import 'dart:io';

class SnapcastService {
  Socket? socket;
  final String serverIp;
  final int port = 1705;
  Function(Map<String, dynamic>)? onMessageReceived;

  SnapcastService(this.serverIp);

  Future<void> connect() async {
    socket = await Socket.connect(serverIp, port);
    socket!.listen((data) {
      final messages = utf8.decode(data).split('\n');
      for (var msg in messages) {
        if (msg.trim().isNotEmpty) {
          try {
            final json = jsonDecode(msg);
            onMessageReceived?.call(json);
          } catch (_) {}
        }
      }
    });
  }

  void send(String method, [dynamic params]) {
    final id = DateTime.now().millisecondsSinceEpoch;
    final request = {
      'jsonrpc': '2.0',
      'id': id,
      'method': method,
      if (params != null) 'params': params,
    };
    socket?.write('${jsonEncode(request)}\n');
  }

  void getStatus() => send('Server.GetStatus');
  void setVolume(String clientId, int percent) => send('Client.SetVolume', {'id': clientId, 'volume': {'percent': percent}});
}