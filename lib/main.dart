import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(36.0),
                  child: Text(
                    'Weather App',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 48,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    'Stadt: Stuttgart',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Gefühlte Temperatur: -10°',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Temperatur: -4°',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Niederschlag: 15.00 mm',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Tageszeit: Tag',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Standort: lat: 48.783, long: 9.183',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: SizedBox(
                      height: 38,
                      width: 240,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          side:
                              const BorderSide(color: Colors.black, width: 0.5),
                          backgroundColor: const Color.fromARGB(
                            255,
                            43,
                            135,
                            100,
                          ),
                        ),
                        child: const Text('Prediction update'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
