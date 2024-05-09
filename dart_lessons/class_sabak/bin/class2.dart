void main() {
  Car unaa = Car('Mers', 2024, 'Ak', 5.5);

  print(unaa.aty);
  print(unaa.jyly);
  print(unaa.tysy);
  print(unaa.matordunKychy);
  unaa.salamdashuu();

  Car unaa2 = Car('BMW', 2020, 'KARA', 2.4);

  print(unaa2.aty);
  print(unaa2.jyly);
  print(unaa2.tysy);
  print(unaa2.matordunKychy);
  unaa2.salamdashuu();

  Car unaa3 = Car('Tesla', 2023, 'Blue', 1.8);

  print(unaa3.aty);
  print(unaa3.jyly);
  print(unaa3.tysy);
  print(unaa3.matordunKychy);
  unaa3.salamdashuu();
}

class Car {
  Car(
    this.aty,
    this.jyly,
    this.tysy,
    this.matordunKychy,
  );

  String? aty;
  int? jyly;
  String? tysy;
  double? matordunKychy;

  void salamdashuu() {
    print('Salam');
  }

  // String aty = 'Mers';
  // int jyly = 2020;
  // String tysy = 'Kara';
  // double matordunKychy = 3.0;
}
