import 'package:flutter/material.dart';
import 'package:fmu_app/telaServicos.dart';
import 'telaAgendamento.dart'; // Importe a tela de agendamento

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a etiqueta de debug
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const TelaServicos(), // Define TelaServicos como a tela inicial
    );
  }
}
