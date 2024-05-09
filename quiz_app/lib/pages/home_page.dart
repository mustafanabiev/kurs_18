import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_model.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/result_icon.dart';

class BashkyBarakcha extends StatefulWidget {
  const BashkyBarakcha({super.key});

  @override
  State<BashkyBarakcha> createState() => _BashkyBarakchaState();
}

class _BashkyBarakchaState extends State<BashkyBarakcha> {
  int index = 0;
  List<bool> jooptor = [];
  List<bool> tuuraJooptor = [];
  List<bool> kataJooptor = [];

  void teksher(bool value) {
    if (quizzes[index].answer == value) {
      jooptor.add(true);
      tuuraJooptor.add(true);
    } else {
      jooptor.add(false);
      kataJooptor.add(false);
    }
    setState(() {
      if (quizzes[index] == quizzes.last) {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Тест аяктады!!!'),
              content: Text(
                'Суроолорунун саны: ${jooptor.length}\n'
                'Сенин туура жоокторуңдун саны: ${tuuraJooptor.length}\n'
                'Сенин ката жоокторуңдун саны: ${kataJooptor.length}\n',
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Тестти кайра баштоо'),
                  onPressed: () {
                    setState(() {
                      index = 0;
                      jooptor.clear();
                      tuuraJooptor.clear();
                      kataJooptor.clear();
                      Navigator.of(context).pop();
                    });
                  },
                ),
              ],
            );
          },
        );
      } else {
        index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: const Color(0xff363636),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
                vertical: 120,
              ),
              child: Text(
                quizzes[index].question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            CustomButton(
              tuuraButtonbu: true,
              baskanda: (value) {
                teksher(value);
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              tuuraButtonbu: false,
              baskanda: (maani) {
                teksher(maani);
              },
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jooptor.length,
                itemBuilder: (context, index) {
                  return jooptor[index] == true
                      ? const ResultIcon(tuuraIconBu: true)
                      : const ResultIcon(tuuraIconBu: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Тапшырма 7'),
      centerTitle: true,
    );
  }
}
