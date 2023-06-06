import 'package:character_creator/domain/actions/create_character.dart';
import 'package:character_creator/domain/model/character.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
              onPressed: () async {
                await CreateCharacter()
                    .create(newItemName)
                    .then((value) => Navigator.pop(context));
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      );
    },
  );
}
