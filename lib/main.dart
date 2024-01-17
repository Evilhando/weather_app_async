import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = 'Stuttgart';
  double apparentTemperature = -10.0;
  double temperature = -4.0;
  double precipitation = 15.0;
  String dayTime = 'Tag';
  double latitude = 48.783;
  double longitude = 9.183;

  Future<String> getWeatherData() async {
    const url =
        'https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=9.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1';

    final response = await http.get(Uri.parse(url));

    return response.body;
  }

  void updateWeatherData() async {
    String jsonString = await getWeatherData();
    final Map<String, dynamic> data = json.decode(jsonString);

    setState(() {
      city = 'Stuttgart';
      apparentTemperature = data['current']['apparent_temperature'];
      temperature = data['current']['temperature_2m'];
      precipitation = data['current']['precipitation'];
      dayTime = data['current']['is_day'] == 1 ? 'Tag' : 'Nacht';
      latitude = data['latitude'];
      longitude = data['longitude'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: -0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Chapter: $city',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.1,
                fontWeight: FontWeight.w800,
                color: Colors.red,
              ),
            ),
            const Divider(
              color: Colors.red,
              thickness: 8,
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.055),
            Text(
              'Gefühlte Temperatur: $apparentTemperature°',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.055,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Temperatur: $temperature°',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Niederschlag: $precipitation mm',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Tageszeit: $dayTime',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Standort: lat: $latitude, long: $longitude',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: MediaQuery.of(context).size.width * 0.92,
              width: MediaQuery.of(context).size.width * 0.94,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/sylo_weapon.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.07),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    updateWeatherData();
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 0.5),
                    backgroundColor: const Color.fromARGB(
                      255,
                      255,
                      255,
                      255,
                    ),
                  ),
                  child: Text(
                    'Prediction update',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
