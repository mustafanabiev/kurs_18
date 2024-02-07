import 'package:card_app/home_page.dart';
import 'package:flutter/material.dart';

class InsertDataPage extends StatelessWidget {
  InsertDataPage({super.key});

  final nameLastNameCtl = TextEditingController();
  final kesibiCtl = TextEditingController();
  final phoneCtl = TextEditingController();
  final emailCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InsertDataPage'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                TextFormField(
                  controller: nameLastNameCtl,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    // hintText: 'Name',
                    labelText: 'Аты-Жөнү',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: kesibiCtl,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    hintText: 'Кесиби',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: phoneCtl,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    labelText: 'Телефон номер',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: emailCtl,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff056C5C),
                      ),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 34),
                SizedBox(
                  width: 160,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameLastNameCtl.text.isNotEmpty &&
                          kesibiCtl.text.isNotEmpty &&
                          phoneCtl.text.isNotEmpty &&
                          emailCtl.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(
                              nameLastName: nameLastNameCtl.text,
                              kesibi: kesibiCtl.text,
                              phone: phoneCtl.text,
                              email: emailCtl.text,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Маалыматтарды толуктап жазыңыз !!!'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff056C5C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text(
                      'Сактоо',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
