import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'pages/home_page.dart';
import 'pages/weather_details_page.dart';
import 'pages/favorites_page.dart';
import 'pages/settings_page.dart';
import 'utils/constants.dart';

void main() async {
  // Ensure Flutter bindings are initialized before loading .env
  
  WidgetsFlutterBinding.ensureInitialized();
  // Load the .env file for API key
  await dotenv.load(fileName: ".env");
  
  // Wrap the app in ProviderScope for Riverpod
  runApp(const ProviderScope(child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.details: (context) => const WeatherDetailsPage(),
        AppRoutes.favorites: (context) => const FavoritesPage(),
        AppRoutes.settings: (context) => const SettingsPage(),
      },
    );
  }
}
