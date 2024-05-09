void main() {
  Adam asan = Adam(
    name: 'Asan',
    age: 30,
    height: 180,
    weight: 78.8,
    merried: true,
  );

  print(asan.name);
  print(asan.age);
  print(asan.height);
  print(asan.weight);
  print(asan.merried);

  Adam uson = Adam(
    name: 'Uson',
    age: 20,
    height: 170,
    weight: 65.4,
    // merried: false,
  );

  print(uson.name);
  print(uson.age);
  print(uson.height);
  print(uson.weight);
  print(uson.merried);

  Adam aigul = Adam(
    name: 'Aigul',
    age: 18,
    height: 158,
    weight: 50,
    merried: false,
  );

  print(aigul.name);
  print(aigul.age);
  print(aigul.height);
  print(aigul.weight);
  print(aigul.merried);
}

class Adam {
  Adam({
    required this.name,
    this.age,
    required this.height,
    required this.weight,
    this.merried,
  });

  final String name;
  final int? age;
  final int height;
  final double weight;
  final bool? merried;
}
