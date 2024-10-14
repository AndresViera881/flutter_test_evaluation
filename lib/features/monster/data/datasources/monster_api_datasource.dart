import 'dart:convert'; // Para decodificar JSON
import 'package:flutter_yuhioh_app/features/monster/data/api/api_config.dart';
import 'package:http/http.dart' as http; // Para hacer solicitudes HTTP
import 'package:flutter_yuhioh_app/features/monster/domain/entities/monster.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/repositories/monster_repository.dart'; // Importar el archivo de configuración

class MonsterApiDataSource implements MonsterRepository {
  @override
  Future<List<Monster>> getMonstersByArchetype(String archetype) async {
    // Utilizar la URL dinámica de ApiConfig
    final url = Uri.parse(ApiConfig.getMonstersByArchetype(archetype));

    // Hacer la solicitud HTTP GET
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON
      final jsonData = json.decode(response.body);

      // Convertir la lista de datos en una lista de entidades Monster
      List<Monster> monsters = (jsonData['data'] as List)
          .map((monsterData) => Monster.fromJson(monsterData))
          .toList();

      return monsters;
    } else {
      throw Exception('Error al cargar el listados de monstruos');
    }
  }

  @override
  Future<Monster> getMonsterDetails(String id) async {
    // Utilizar la URL dinámica de ApiConfig
    final url = Uri.parse(ApiConfig.getMonsterDetails(id));

    // Hacer la solicitud HTTP GET
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON y retornar el Monster
      final jsonData = json.decode(response.body);
      return Monster.fromJson(jsonData['data'][0]);
    } else {
      throw Exception('Failed to load monster details');
    }
  }
}
