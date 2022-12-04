import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show debugPrintThrottled;
import 'dart:developer' show log;
import 'dart:convert';
import 'constants.dart';
import 'models.dart';

final debugPrint = (String? message, {int? wrapWidth}) {
  debugPrintThrottled(message, wrapWidth: wrapWidth ?? 70);
};

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
            const Text("Short String"),
            buttonRow(kShortString, "String"),
            const SizedBox(height: 20),
            const Text("Long String"),
            buttonRow(kString, "String"),
            const SizedBox(height: 20),
            const Text("Large List"),
            buttonRow(kList, "List"),
            const SizedBox(height: 20),
            const Text("Deep Map"),
            buttonRow(kMap, "Map"),
            const SizedBox(height: 20),
            const Text("Dart Class (Model Object)"),
            buttonRow(jsonEncode(model), "Model"),
          ],
        ),
      ),
    );
  }

  Widget buttonRow(dynamic data, String message) {
    return SizedBox(
      width: 280,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            onPressed: () {
              print(data);
            },
            child: const Text("print"),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              debugPrint(data.toString());
            },
            child: const Text("debugPrint"),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              log(
                "Log Event $message",
                name: "buttonRow.$message",
                error: data,
                level: 1000,
              );
            },
            child: const Text("log"),
          ),
        ],
      ),
    );
  }
}
