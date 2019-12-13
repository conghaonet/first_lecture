import 'dart:isolate';

main() {
  print('main start');
//  ReceivePort receivePort = ReceivePort();
  Isolate.spawn(foo, 'isolate');
  print('main end');
}

foo(String str) {
  print('value = $str');
}