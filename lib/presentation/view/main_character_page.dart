
import 'package:character_creator/domain/model/character.dart';
import 'package:flutter/material.dart';

class MainCharacterPageRoute extends StatefulWidget {
  final Character character;

  const MainCharacterPageRoute(this.character, {Key? key}) : super(key: key);

  @override
  State<MainCharacterPageRoute> createState() => _MainCharacterPageRouteState();
}

class _MainCharacterPageRouteState extends State<MainCharacterPageRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Name: ${character.name}'),
            // Text('Age: ${character.age}'),
          ],
        ),
      ),
    );
  }
}
