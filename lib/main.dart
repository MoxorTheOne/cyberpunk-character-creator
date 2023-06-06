import 'package:character_creator/domain/model/character.dart';
import 'package:character_creator/presentation/view/create_character_modal.dart';
import 'package:character_creator/presentation/view/main_character_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: StreamBuilder<List<Character>>(
        stream: readCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final characters = snapshot.data!;
            return ListView(children: characters.map(characterRow).toList());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newCharacter,
        tooltip: 'Crear nuevo personaje',
        child: const Icon(Icons.add),
      ),
    );
  }

  ListTile characterRow(Character character) => ListTile(
        title: Text(character.name),
      );

  Stream<List<Character>> readCharacters() => FirebaseFirestore.instance
      .collection('characters')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Character.fromJson(doc.data())).toList());
}
