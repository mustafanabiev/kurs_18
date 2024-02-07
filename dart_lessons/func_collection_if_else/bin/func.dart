void main() {
  koshuu(
    a: 5,
    b: 4,
    name: 'Asan',
    age: 30,
    salmak: 60,
    uyzunduk: 170,
  );
}

void koshuu({
  required int a,
  required int b,
  required String name,
  required int age,
  int? salmak,
  int? uyzunduk,
}) {
  print(name);
  int summa = a + b;
  print(summa);
  print(age);
}
