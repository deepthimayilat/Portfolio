import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF0066CC),
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F7FA),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0066CC),
    foregroundColor: Colors.white,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF7B2FFF),
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: const Color(0xFF0A0F1F),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121826),
    foregroundColor: Colors.white,
  ),
);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deepthi Portfolio',
      theme: _isDarkMode ? darkTheme : lightTheme,
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        onToggleTheme: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        },
      ),
    );
  }
}
