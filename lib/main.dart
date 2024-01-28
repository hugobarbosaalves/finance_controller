import 'package:finance_controller/views/initial/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'views/home/home_page.dart';
import 'views/settings/settings_page.dart';
import 'views/transactions/transactions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Controller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.amber[800],
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/transactions': (context) => const TransactionsPage(),
        '/initial': (context) => const InitialPage(),
        '/settings': (context) => const SettingsPage(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('pt', ''),
      ],
    );
  }
}
