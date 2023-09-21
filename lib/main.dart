import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_turtle/flutter_turtle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Florecita',
      home: const FlowerPage(),
    );
  }
}

class FlowerPage extends StatefulWidget {
  const FlowerPage({Key? key});

  @override
  State<FlowerPage> createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
  @override
  Widget build(BuildContext context) {
    Color randomColor() {
      var colors = [
        Colors.yellow,
        Colors.orange,
      ];
      return colors[Random().nextInt(colors.length)];
    }

    final commands = [
      PenDown(),
      Repeat((_) => 8, [
        SetColor((_) => randomColor()),
        Repeat((_) => 2, [
          Repeat((_) => 100, [Forward((_) => 2.0), Right((_) => 1.0)]),
          Right((_) => 80.0)
        ]),
        Right((_) => 45.0),
      ]),

      // Código existente

      PenDown(), // Agregamos esto
      SetColor((_) => Colors.green),
      Repeat((_) => 50, [
        Forward((_) => -100),
      ]),
    ];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Florecita 🌻'),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            TextButton(
              onPressed: () => setState(() {}),
              child: const Text(
                'Dibujar de Nuevo',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Gracias por ser una gran amiga'),
            ),
            Expanded(
              child: AnimatedTurtleView(
                commands: commands,
                child: const SizedBox.expand(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text('Desarrollado por: Paulo Daniel Batuani'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
