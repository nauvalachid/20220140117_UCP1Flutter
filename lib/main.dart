import 'package:flutter/material.dart';
import 'package:ucp1/login_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {  initializeDateFormatting('id_ID', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
    );
  }
}