import 'package:flutter/material.dart';
import 'dart:developer' show log;
import 'dart:convert';
import 'constants.dart';
import 'models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logging View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final model = MenuModel.fromJson(kModelData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logging View Demo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            const Text("Press Button to Log"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                log(
                  "Log Event: Short String",
                  name: "buttonLog",
                  error: kShortString,
                );
              },
              child: const Text("Short String"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.red,
                ),
              ),
              onPressed: () {
                log(
                  "Log Event: Long String",
                  name: "buttonLog",
                  error: kString,
                  level: 1000,
                );
              },
              child: const Text("Long String (Severe Event)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                log(
                  "Log Event: Large List",
                  name: "buttonLog",
                  error: kList,
                );
              },
              child: const Text("Large List"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                log(
                  "Log Event: Map",
                  name: "buttonLog",
                  error: kMap,
                );
              },
              child: const Text("Map"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                log(
                  "Log Event: Dart Object (Custom Class)",
                  name: "buttonLog",
                  error: jsonEncode(model),
                );
              },
              child: const Text("Dart Object (Custom Class)"),
            ),
          ],
        ),
      ),
    );
  }
}
