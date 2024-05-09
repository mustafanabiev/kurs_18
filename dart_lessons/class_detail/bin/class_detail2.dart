void main() {
  Kyrgyzstan kg = Kyrgyzstan(
    aianty: 200000,
    kalky: 7000000,
    tili: 'Kyrgyz',
    oblast: 7,
    uluttar: 80,
    egemenduubu: true,
    tooluuJerdinAianty: 150000,
  );

  print(kg.tili);
  print(kg.egemenduubu);
  kg.maalymat();

  Kazakstan kz = Kazakstan(
    aianty: 1000000,
    kalky: 20000000,
    tili: 'Kazak',
    oblast: 10,
    uluttar: 100,
    egemenduubu: true,
    cholduuJerdinAianty: 200000,
  );

  print(kz.tili);
  print(kz.egemenduubu);
  kz.maalymat();
}

class Olko {
  Olko({
    required this.aianty,
    required this.kalky,
    required this.tili,
    required this.oblast,
    required this.uluttar,
    required this.egemenduubu,
  });

  final double aianty;
  final int kalky;
  final String tili;
  final int oblast;
  final int uluttar;
  final bool egemenduubu;

  void maalymat() {
    print('Salam Olko');
  }
}

class Kyrgyzstan extends Olko {
  Kyrgyzstan({
    required super.aianty,
    required super.kalky,
    required super.tili,
    required super.oblast,
    required super.uluttar,
    required super.egemenduubu,
    required this.tooluuJerdinAianty,
  });

  final int tooluuJerdinAianty;

  @override
  void maalymat() {
    print('Salam Kyrgyzstan');
  }
}

class Kazakstan extends Olko {
  Kazakstan({
    required super.aianty,
    required super.kalky,
    required super.tili,
    required super.oblast,
    required super.uluttar,
    required super.egemenduubu,
    required this.cholduuJerdinAianty,
  });

  final int cholduuJerdinAianty;

  @override
  void maalymat() {
    print('Salam Kazakstan');
  }
}
