void main() {
  B b = B();
  b.a();
//  b.a1();
  b.aa();
}

class C extends B {

}

class B with A1,A {

  void a() {
    print('b');
  }

  void aa() => print('bb');

}

class A {
  void a() {
    print('a');
  }
  void aa() => print('aa');
}
class A1 {
  void a1() {
    print('a1');
  }
  void aa() => print('aa1');
}
