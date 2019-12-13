import 'dart:async';

main() {
  print('main start');
  Future(() => print('task 1'));
  Future.delayed(Duration(seconds: 1), () => print('task 2'));
  scheduleMicrotask(() => print('task 3'));
  Future(() => Future(() => print('task 4')));
  Future(() => print('task 5')).then((_) => print('task 6'));

  Future(() => print('task 7')).then((_){
    print('task 8');
    Future(() => print('task 9'));
    scheduleMicrotask(() => print('task 10'));
  }).then((_) {
    print('task 11');
  });
  print('main end');
}