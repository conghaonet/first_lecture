void main() {
  B b = B();
  b.a();
  b.a1();
  print(b._counter);
}

///mixin混入，用with关键字实现。
class B extends A with A1 implements A2 {
  void a() {
    print('B');
  }
}

class A{
  int _counter = 1;
  void a() {
    print('a');
  }
}

class A1 {
  void a() {
    print('a1-a');
  }
  void a1() {
    print('a1');
  }
}

class A2 {

}

///mixin