void main() {
  Car unaa = Car();

  print(unaa.aty);
  print(unaa.jyly);
  print(unaa.tysy);
  print(unaa.matordunKychy);

  Car2 unaa2 = Car2();

  print(unaa2.aty);
  print(unaa2.jyly);
  print(unaa2.tysy);
  print(unaa2.matordunKychy);

  Car3 unaa3 = Car3();

  print(unaa3.aty);
  print(unaa3.jyly);
  print(unaa3.tysy);
  print(unaa3.matordunKychy);
}

class Car {
  String aty = 'Mers';
  int jyly = 2020;
  String tysy = 'Kara';
  double matordunKychy = 3.0;
}

class Car2 {
  String aty = 'BMW';
  int jyly = 2020;
  String tysy = 'Ak';
  double matordunKychy = 4.0;
}

class Car3 {
  String aty = 'Tesla';
  int jyly = 2023;
  String tysy = 'Kyzyl';
  double matordunKychy = 2.0;
}
