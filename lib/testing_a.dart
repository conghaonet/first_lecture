void main() {
  final listA = [1,2,3];
  const listB = [Student('1'), Student('2'), Student('3')];

  const Student stu = Student('');

  listA[0] = 4;
//  listB[0] = 4;

}

class Student {
  final String name;
  const Student(this.name);
}