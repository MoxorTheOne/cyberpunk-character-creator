
import 'package:character_creator/domain/model/character.dart';
import 'package:flutter/material.dart';

Future<Character?> createNewCharacter(BuildContext context) async {
  String newItemName = '';

  return showModalBottomSheet<Character>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) {
                newItemName = value;
              },
              decoration: const InputDecoration(
                  labelText: 'Nombre del personaje (puede cambiarse luego)'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Character(newItemName), // Return the ModalResult object
                );
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      );
    },
  );
}
