import 'package:flutter/material.dart';
import 'package:flutter_yuhioh_app/features/monster/presentation/viewmodels/monster_view_model.dart';
import 'package:provider/provider.dart';

class StateProvider {
  // Método para manejar la búsqueda de monstruos
  void fetchMonsters(BuildContext context, String archetype) {
    final viewModel = Provider.of<MonsterViewModel>(context, listen: false);
    viewModel.fetchMonsters(archetype); // Cambia el arquetipo dinámicamente
  }
}
