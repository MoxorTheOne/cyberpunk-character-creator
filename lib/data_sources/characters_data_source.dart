

import 'package:character_creator/domain/model/character.dart';

class CharactersDataSource {
  static List<Character> _data = [];

  static setData(List<Character> value) => _data = value;
  static getData() => _data;
}
