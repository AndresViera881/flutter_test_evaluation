import 'package:flutter/material.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/entities/monster.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/usecases/monster_uses_case.dart';

class MonsterViewModel extends ChangeNotifier {
  final GetMonstersUseCase _getMonstersUseCase;
  List<Monster> monsters = [];

  MonsterViewModel(this._getMonstersUseCase) {
    // Llama a fetchMonsters en el constructor
    fetchMonsters('Crystron'); // Cambia el arquetipo según sea necesario
  }

  Future<void> fetchMonsters(String archetype) async {
    monsters = await _getMonstersUseCase.execute(archetype);
    notifyListeners(); // Notifica a los oyentes que los datos han cambiado
  }
}
