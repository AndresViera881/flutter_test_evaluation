import 'package:flutter/material.dart';
import 'package:flutter_yuhioh_app/features/monster/presentation/state/state_provider.dart';
import 'package:flutter_yuhioh_app/features/monster/presentation/viewmodels/monster_view_model.dart';
import 'package:flutter_yuhioh_app/features/monster/presentation/widgets/monster_detail_screen.dart';
import 'package:provider/provider.dart';

class MonsterListScreen extends StatelessWidget {
  final String archetype;

  const MonsterListScreen({super.key, required this.archetype});

  @override
  Widget build(BuildContext context) {
    final stateProvider = StateProvider();
    return Scaffold(
      appBar: AppBar(title: Text(archetype)),
      body: Column(
        children: [
          // Fila de botones
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    stateProvider.fetchMonsters(context, "Crystron");
                  },
                  child: const Text("Crystron"),
                ),
                ElevatedButton(
                  onPressed: () {
                    stateProvider.fetchMonsters(context, "Destiny HERO");
                  },
                  child: const Text("Destiny HERO"),
                ),
                ElevatedButton(
                  onPressed: () {
                    stateProvider.fetchMonsters(context, "Six Samurai");
                  },
                  child: const Text("Six Samurai"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<MonsterViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.monsters.isEmpty) {
                  return const Center(
                      child: CircularProgressIndicator()); // Indicador de carga
                }
                return Scrollbar(
                  // Scrollbar visible
                  thumbVisibility:
                      true, // Mantener visible el scrollbar mientras se desplaza
                  child: ListView.builder(
                    itemCount: viewModel.monsters.length,
                    itemBuilder: (context, index) {
                      final monster = viewModel.monsters[index];
                      return ListTile(
                        leading: Image.network(
                          monster.imageUrl, // Mostrar imagen del monstruo
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(monster.name),
                        subtitle: Text(monster.archetype),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MonsterDetailScreen(monster: monster),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
