import 'package:web_socket_channel/web_socket_channel.dart';

class SnapcastService {
  WebSocketChannel? _channel;

  void connect(String serverIp) {
    _channel = WebSocketChannel.connect(Uri.parse('ws://$serverIp:1705'));
    _channel!.stream.listen((message) {
      print('Snapcast: $message');
    });
  }

  void sendCommand(String command) {
    _channel?.sink.add(command);
  }
}