import 'package:character_creator/domain/model/lifepath.dart';

class Character {
  String id;
  String name;
  Lifepath lifepath = Lifepath();

  Character(this.id, this.name);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lifepath': lifepath.toJson(),
    };
  }
}
