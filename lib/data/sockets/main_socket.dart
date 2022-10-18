import 'package:client/data/models/shipment.model.dart';
import 'package:get/get.dart';

import '/statics/apis.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Sockets {
  Sockets() {
    intiConnection;
  }

  Future intiConnection(String uuid) async {
    Socket socket = io(
            '$mainUrl/$uuid',
            OptionBuilder()
                .setTransports(['websocket']) // for Flutter or Dart VM
                .disableAutoConnect()
                .build())
        .connect();

    socket.connect();
    socket.onConnect((data) => print('connected :: $data'));
    socket.onConnectError((data) => print('connection er! :: $data'));
    // socket.onerror((e) => print(e.toString()));
    socket.onError((e) => print(e.toString()));

    // testConnection();
    // Future.delayed(Duration(seconds: 5), () {
    //   socket.emit('newshipment', 'musabya');
    //   print('EMitted');
    // });

    socket.on('offers/$uuid', (data) {
      var shi = Shipment.fromJson(data);
      Get.snackbar('New Offer', shi.uuid!.toString());
      print('Got Some');
      print(data);
      return data;
    });
  }

  // Future testConnection() async {
  //   socket.on('/test', (data) {
  //     Get.snackbar('from Socket', data.toString());
  //     print(data);
  //     return data;
  //   });
  // }
}
