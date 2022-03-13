import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/api_service.dart';
import 'package:provider_test/main_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ApiService())
    ],
    child: const MaterialApp(home: MainScreen())));
}
