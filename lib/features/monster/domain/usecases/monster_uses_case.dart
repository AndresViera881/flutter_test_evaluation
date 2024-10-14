import 'package:flutter_yuhioh_app/features/monster/domain/entities/monster.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/repositories/monster_repository.dart';

class GetMonstersUseCase {
  final MonsterRepository monsterRepository;

  GetMonstersUseCase(this.monsterRepository);

  Future<List<Monster>> execute(String archetype) async {
    if (archetype.isEmpty) {
      throw ArgumentError('El arquetipo no puede estar vacío');
    }
    return monsterRepository.getMonstersByArchetype(archetype);
  }
}
