import 'package:character_creator/create_character_modal.dart';
import 'package:character_creator/domain/character.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cyberpunk RED'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Character> _characters = [];

  Future<void> _newCharacter() async {
    Character? result = await createNewCharacter(context);
    if (result != null) {
      setState(() {
        _characters.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _characters
              .map((e) => ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('edit ${e.name}');
                  },
                  child: Text(e.name)))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newCharacter,
        tooltip: 'Crear nuevo personaje',
        child: const Icon(Icons.add),
      ),
    );
  }
}
