import 'package:flutter/material.dart';
import 'package:flutter_yuhioh_app/features/monster/data/datasources/monster_api_datasource.dart';
import 'package:flutter_yuhioh_app/features/monster/domain/usecases/monster_uses_case.dart';
import 'package:flutter_yuhioh_app/features/monster/presentation/widgets/monster_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_yuhioh_app/features/monster/presentation/viewmodels/monster_view_model.dart'; // Asegúrate de que el path sea correcto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final monsterRepository =
            MonsterApiDataSource(); // Crear la instancia del repositorio
        final getMonstersUseCase = GetMonstersUseCase(
            monsterRepository); // Pasar el repositorio al caso de uso
        return MonsterViewModel(
            getMonstersUseCase); // Proporcionar el ViewModel
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yu-Gi-Oh! Monsters',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MonsterListScreen(
            archetype: 'Yu-Gi-Oh! Monsters'), // Pantalla inicial
      ),
    );
  }
}
