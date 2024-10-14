import 'package:flutter/material.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/entities/monster.dart';
import 'package:flutter_yuhioh_app/features/monster/presentation/viewmodels/monster_view_model.dart';

class MockMonsterViewModel extends ChangeNotifier implements MonsterViewModel {
  final List<Monster> _monsters = [];

  @override
  List<Monster> get monsters => _monsters;

  @override
  set monsters(List<Monster> value) {
    _monsters.clear();
    _monsters.addAll(value);
    notifyListeners();
  }

  @override
  Future<void> fetchMonsters(String archetype) async {
    // Simular una carga de datos con un monstruo ficticio
    await Future.delayed(Duration(milliseconds: 100));
    _monsters.add(Monster(
      id: 1,
      name: "Test Monster",
      type: "Type",
      frameType: "FrameType",
      description: "Description",
      attack: 1000,
      defense: 1000,
      level: 4,
      race: "Race",
      attribute: "Attribute",
      cardSets: [],
      imageUrl: "https://example.com/image.png",
      archetype: archetype,
    ));
    notifyListeners();
  }
}
