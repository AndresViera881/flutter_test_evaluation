class Monster {
  final int id;
  final String name;
  final String type;
  final String frameType;
  final String description;
  final int attack;
  final int defense;
  final int level;
  final String race;
  final String? attribute;
  final List<CardSet> cardSets;
  final String imageUrl;
  final String archetype;

  Monster(
      {required this.id,
      required this.name,
      required this.type,
      required this.frameType,
      required this.description,
      required this.attack,
      required this.defense,
      required this.level,
      required this.race,
      required this.attribute,
      required this.cardSets,
      required this.imageUrl,
      required this.archetype});

  // Método fromJson para mapear los datos del JSON a la clase Monster
  factory Monster.fromJson(Map<String, dynamic> json) {
    return Monster(
      id: json['id'] as int,
      name: json['name'] as String,
      type: json['type'] as String,
      frameType: json['frameType'] as String,
      description: json['desc'] as String,
      attack: json['atk'] != null ? json['atk'] as int : 0,
      defense: json['def'] != null ? json['def'] as int : 0,
      level: json['level'] != null ? json['level'] as int : 0,
      race: json['race'] as String,
      attribute: json['attribute'] != null ? json['attribute'] as String : '',
      cardSets: json['card_sets'] != null
          ? (json['card_sets'] as List<dynamic>)
              .map((cardSet) => CardSet.fromJson(cardSet))
              .toList()
          : [],
      imageUrl: json['card_images'][0]['image_url'] as String,
      archetype: json['archetype'] as String,
    );
  }
}

// Clase para representar los conjuntos de cartas
class CardSet {
  final String setName;
  final String setCode;
  final String setRarity;
  final String setRarityCode;
  final String setPrice;

  CardSet({
    required this.setName,
    required this.setCode,
    required this.setRarity,
    required this.setRarityCode,
    required this.setPrice,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      setName: json['set_name'] as String,
      setCode: json['set_code'] as String,
      setRarity: json['set_rarity'] as String,
      setRarityCode: json['set_rarity_code'] as String,
      setPrice: json['set_price'] as String,
    );
  }
}
