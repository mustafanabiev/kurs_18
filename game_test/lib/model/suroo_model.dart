class Suroo {
  const Suroo({
    required this.text,
    required this.image,
    required this.jooptor,
  });

  final String text;
  final String image;
  final List<Joop> jooptor;
}

class Joop {
  const Joop({
    required this.text,
    this.isTrue = false,
  });

  final String text;
  final bool isTrue;
}

List<Suroo> asiaQuestions = [s1, s2, s3, s4, s5, s6, s7, s8, s9, s10];

List<Suroo> europaQuestions = [s10, s1, s8, s2, s5, s3, s4, s6, s7, s8];

const s1 = Suroo(
  text: 'Бишкек',
  image: 'bishkek.jpeg',
  jooptor: [
    Joop(text: 'Кыргызстан', isTrue: true),
    Joop(text: 'Кытай'),
    Joop(text: 'Россия'),
    Joop(text: 'Казакстан'),
  ],
);

const s2 = Suroo(
  text: 'Ашхабат',
  image: 'ashhabad.jpeg',
  jooptor: [
    Joop(text: 'Корея'),
    Joop(text: 'Япония'),
    Joop(text: 'Түрмөнстан', isTrue: true),
    Joop(text: 'Афганистан'),
  ],
);

const s3 = Suroo(
  text: 'Астана',
  image: 'astana.jpeg',
  jooptor: [
    Joop(text: 'Афганистан'),
    Joop(text: 'Казакстан', isTrue: true),
    Joop(text: 'Малазия'),
    Joop(text: 'Япония'),
  ],
);

const s4 = Suroo(
  text: 'Душанбе',
  image: 'dushanbe.jpeg',
  jooptor: [
    Joop(text: 'Тайланд'),
    Joop(text: 'Аравия'),
    Joop(text: 'ОАЭ'),
    Joop(text: 'Тажикстан', isTrue: true),
  ],
);

const s5 = Suroo(
  text: 'Ню-Дели',
  image: 'new-delhi.jpeg',
  jooptor: [
    Joop(text: 'Пакистан'),
    Joop(text: 'Бангладеш'),
    Joop(text: 'Индия', isTrue: true),
    Joop(text: 'Малазия'),
  ],
);

const s6 = Suroo(
  text: 'Пекин',
  image: 'pekin.jpeg',
  jooptor: [
    Joop(text: 'Кувейт'),
    Joop(text: 'Палестина'),
    Joop(text: 'Турция'),
    Joop(text: 'Кытай', isTrue: true),
  ],
);

const s7 = Suroo(
  text: 'Сеул',
  image: 'seul.jpeg',
  jooptor: [
    Joop(text: 'Түшүк Корея', isTrue: true),
    Joop(text: 'Филипин'),
    Joop(text: 'Азербайжан'),
    Joop(text: 'Непал'),
  ],
);

const s8 = Suroo(
  text: 'Ташкент',
  image: 'tashkent.jpeg',
  jooptor: [
    Joop(text: 'Бангладеш'),
    Joop(text: 'Пакистан'),
    Joop(text: 'өзбекстан', isTrue: true),
    Joop(text: 'Кувейт'),
  ],
);

const s9 = Suroo(
  text: 'Токио',
  image: 'tokyo.jpeg',
  jooptor: [
    Joop(text: 'Япония', isTrue: true),
    Joop(text: 'Россия'),
    Joop(text: 'Түндүк Корея'),
    Joop(text: 'Армения'),
  ],
);

const s10 = Suroo(
  text: 'Улан Батор',
  image: 'ulan_bator.jpeg',
  jooptor: [
    Joop(text: 'Турция'),
    Joop(text: 'Кыргызстан'),
    Joop(text: 'Монголия', isTrue: true),
    Joop(text: 'Малазия'),
  ],
);
