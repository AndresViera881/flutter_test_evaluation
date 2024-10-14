import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/entities/monster.dart';

void main() {
  group('Monster.fromJson', () {
    test('debería crear un objeto Monster a partir de un JSON válido', () {
      final json = {
        'id': 1,
        'name': 'Blue-Eyes White Dragon',
        'type': 'Dragon',
        'frameType': 'Normal',
        'desc': 'A legendary dragon that is a symbol of power.',
        'atk': 3000,
        'def': 2500,
        'level': 8,
        'race': 'Dragon',
        'attribute': 'Light',
        'card_sets': [
          {
            'set_name': 'Legend of Blue Eyes White Dragon',
            'set_code': 'LOB-001',
            'set_rarity': 'Ultra Rare',
            'set_rarity_code': 'UR',
            'set_price': '30.00'
          }
        ],
        'card_images': [
          {'image_url': 'http://example.com/image.png'}
        ],
        'archetype': 'Dragon'
      };

      final monster = Monster.fromJson(json);

      expect(monster.id, 1);
      expect(monster.name, 'Blue-Eyes White Dragon');
      expect(monster.type, 'Dragon');
      expect(monster.frameType, 'Normal');
      expect(
          monster.description, 'A legendary dragon that is a symbol of power.');
      expect(monster.attack, 3000);
      expect(monster.defense, 2500);
      expect(monster.level, 8);
      expect(monster.race, 'Dragon');
      expect(monster.attribute, 'Light');
      expect(monster.cardSets.length, 1);
      expect(monster.cardSets[0].setName, 'Legend of Blue Eyes White Dragon');
      expect(monster.imageUrl, 'http://example.com/image.png');
      expect(monster.archetype, 'Dragon');
    });

    test('debería manejar campos nulos correctamente', () {
      final json = {
        'id': 2,
        'name': 'Dark Magician',
        'type': 'Spellcaster',
        'frameType': 'Normal',
        'desc': 'The ultimate wizard in terms of attack and defense.',
        'atk': null,
        'def': null,
        'level': null,
        'race': 'Spellcaster',
        'attribute': null,
        'card_sets': null,
        'card_images': [
          {'image_url': 'http://example.com/image.png'}
        ],
        'archetype': 'Magician'
      };

      final monster = Monster.fromJson(json);

      expect(monster.id, 2);
      expect(monster.attack, 0); // Valor por defecto
      expect(monster.defense, 0); // Valor por defecto
      expect(monster.level, 0); // Valor por defecto
      expect(monster.attribute, ''); // Cadena vacía por defecto
      expect(monster.cardSets.isEmpty, true); // Lista vacía por defecto
      expect(monster.imageUrl, 'http://example.com/image.png');
      expect(monster.archetype, 'Magician');
    });
  });
}
