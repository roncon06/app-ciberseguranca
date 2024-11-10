import 'package:flutter/material.dart';
import 'package:mobile/screens/recomendacoes_screen.dart';
import 'package:mobile/screens/senhas_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AlertasRecomendacoesScreen(),
    );
  }
}
