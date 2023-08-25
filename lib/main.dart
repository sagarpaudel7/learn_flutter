import 'package:flutter/material.dart';
import 'package:learn_flutter/flutter_projects/currency_converter_app/currency_converter.dart';
import 'package:learn_flutter/flutter_ideas/column_ideas.dart';
import 'package:learn_flutter/flutter_projects/weather_app/weather_app.dart';

void main() {
  runApp(const LearnFlutter());
}

class LearnFlutter extends StatelessWidget {
  const LearnFlutter({super.key});
  @override
  Widget build(BuildContext context) {
    //return const MaterialApp(home: ColumnIdeas());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const WeatherApp(),
    );
  }
}
