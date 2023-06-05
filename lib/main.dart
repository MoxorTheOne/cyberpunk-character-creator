import 'package:character_creator/domain/model/character.dart';
import 'package:character_creator/presentation/view/create_character_modal.dart';
import 'package:character_creator/presentation/view/main_character_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
              .map((character) => ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print('edit ${character.name}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainCharacterPageRoute(character),
                      ),
                    );
                  },
                  child: Text(character.name)))
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
