import 'package:dynamic_color/dynamic_color.dart';
import 'package:feewu/pages/analytics.dart';
import 'package:feewu/pages/settings.dart';
import 'package:feewu/pages/things.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  int currentPageIndex = 0;

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
          localizationsDelegates: [GlobalMaterialLocalizations.delegate],
          supportedLocales: [Locale("en"), Locale("zh")],
          home: Scaffold(
            appBar: AppBar(title: Text("费物")),
            body: [
              ThingsPage(),
              AnalyticsPage(),
              SettingsPage(),
            ][currentPageIndex],
            bottomNavigationBar: NavigationBar(
              destinations: [
                NavigationDestination(icon: Icon(Icons.list), label: "物品"),
                NavigationDestination(icon: Icon(Icons.analytics), label: "统计"),
                NavigationDestination(icon: Icon(Icons.settings), label: "设置"),
              ],
              selectedIndex: currentPageIndex,
              onDestinationSelected: (index) => {
                setState(() {
                  currentPageIndex = index;
                }),
              },
            ),
          ),
        );
      },
    );
  }
}
