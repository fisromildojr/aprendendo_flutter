import 'dart:collection';

import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:flutter/material.dart';

class CachorroController extends ChangeNotifier {
  List<Cachorro> _lista = [
    Cachorro(
      id: 1,
      nome: 'Pitu',
      descricao: 'Preto com manchas brancas',
      idade: 2,
    ),
    Cachorro(
      id: 2,
      nome: 'Carote',
      descricao: 'Branco',
      idade: 5,
    ),
    Cachorro(
      id: 3,
      nome: 'Jamel',
      descricao: 'Caramelo',
      idade: 6,
    ),
  ];

  UnmodifiableListView<Cachorro> get lista => UnmodifiableListView(_lista);

  save(Cachorro cachorro) {
    _lista.add(cachorro);
    notifyListeners();
  }

  delete(Cachorro cachorro) {
    _lista.remove(cachorro);
    notifyListeners();
  }
}
