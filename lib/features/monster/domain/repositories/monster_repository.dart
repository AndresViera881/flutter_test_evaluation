import 'package:flutter_yuhioh_app/features/monster/domain/entities/monster.dart';

abstract class MonsterRepository {
  Future<List<Monster>> getMonstersByArchetype(String archetype);
  Future<Monster> getMonsterDetails(String id);
}
