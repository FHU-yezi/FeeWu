import 'package:dynamic_color/dynamic_color.dart';
import 'package:feewu/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: "费物",
          theme: ThemeData(
            colorScheme:
                lightColorScheme ??
                ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          darkTheme: ThemeData(
            colorScheme:
                darkColorScheme ?? ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
