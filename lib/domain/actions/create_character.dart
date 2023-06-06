import 'package:character_creator/domain/model/character.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateCharacter {
  Future create(String name) async {
    final document = FirebaseFirestore.instance.collection('characters').doc();
    final character = Character(document.id, name);
    await document.set(character.toJson());
  }
}
