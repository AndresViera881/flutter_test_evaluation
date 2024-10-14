import 'package:flutter/material.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/entities/monster.dart';

class MonsterDetailScreen extends StatelessWidget {
  final Monster monster;

  const MonsterDetailScreen({super.key, required this.monster});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(monster.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ilustración del monstruo
              const Center(
                child: Text(
                  "ILUSTRACIÓN",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.network(
                  monster.imageUrl,
                  height: 550,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              // Datos de la carta
              const Center(
                child: Text(
                  "DATOS DE LA CARTA",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoCard("Name:", monster.name),
              _buildInfoCard("Archetype:", monster.archetype),
              _buildInfoCard("Attack:", monster.attack.toString()),
              _buildInfoCard("Defense:", monster.defense.toString()),
              _buildInfoCard("Level:", monster.level.toString()),
              _buildInfoCard("Race:", monster.race.toString()),
              _buildInfoCard("Attribute:", monster.attribute ?? "Unknown"),

              const SizedBox(height: 10),

              // Descripción del monstruo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SelectionArea(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        monster.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Mostrar los Card Sets
              const Text(
                "Card Sets",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // Lista de CardSets
              Column(
                children: monster.cardSets.map((cardSet) {
                  return _buildCardSetInfo(cardSet);
                }).toList(),
              ),

              //Agregar un boton que diga ATRAS y me lleve a la pagina inicial
              // Código para el botón alineado a la derecha
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Alinear el botón a la derecha
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Atrás'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir tarjetas de información
  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para mostrar cada CardSet
  // Método para mostrar cada CardSet en un formato similar a _buildInfoCard
  Widget _buildCardSetInfo(CardSet cardSet) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4, // Añadir sombra para darle profundidad
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard("Set Name:", cardSet.setName),
            _buildInfoCard("Set Code:", cardSet.setCode),
            _buildInfoCard("Set Rarity:", cardSet.setRarity),
            _buildInfoCard("Set Rarity Code:", cardSet.setRarityCode),
            _buildInfoCard("Set Price:", cardSet.setPrice),
          ],
        ),
      ),
    );
  }
}
