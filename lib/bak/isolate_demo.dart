import 'dart:isolate';

main() async {
  ReceivePort receivePort = ReceivePort();
  Isolate _isolate = await Isolate.spawn(foo, receivePort.sendPort);

  receivePort.listen((message){
    print(message);
    if((message as String).contains('!')) {
      receivePort.close();

    }

  });
}

foo(SendPort sendPort) {
  sendPort.send('Hello world');
  sendPort.send('Hello world !!');
}