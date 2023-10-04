import 'package:aprendendo_flutter/modules/cachorro/controllers/cachorro_controller.dart';
import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:aprendendo_flutter/modules/cachorro/widgets/form_cachorro.dart';
import 'package:aprendendo_flutter/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CachorroListPage extends StatefulWidget {
  const CachorroListPage({super.key});

  @override
  State<CachorroListPage> createState() => _CachorroListPageState();
}

class _CachorroListPageState extends State<CachorroListPage> {
  final _formKey = GlobalKey<FormState>();
  late CachorroController controller;

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _idadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller = context.watch<CachorroController>();
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text(
          "Listagem de Cachorros",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _create,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: controller.lista.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text(controller.lista[index].nome ?? '-'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.lista[index].descricao ?? '-'),
                  Text('${controller.lista[index].idade} Anos'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => _edit(controller.lista[index]),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.amber,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _delete(controller.lista[index]),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      var cachorro = Cachorro(
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        idade: int.parse(_idadeController.text),
      );
      controller.save(cachorro);
      Navigator.of(context).pop();
    }
  }

  void _update(Cachorro cachorro) {
    if (_formKey.currentState?.validate() ?? false) {
      // Recupera o cachorro para edição
      var cachorroEdit =
          controller.lista.firstWhere((element) => element == cachorro);

      // Remove o cachorro da lista
      controller.lista.removeWhere((element) => element == cachorro);

      // Edita o cachorro recuperado com os novos valores
      cachorroEdit.nome = _nomeController.text;
      cachorroEdit.descricao = _descricaoController.text;
      cachorroEdit.idade = int.parse(_idadeController.text);

      controller.save(cachorroEdit);

      Navigator.of(context).pop();
    }
  }

  void _delete(Cachorro cachorro) {
    controller.delete(cachorro);
  }

  void _create() {
    _nomeController.clear();
    _descricaoController.clear();
    _idadeController.clear();

    var alert = AlertDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Novo Cachorro"),
        ],
      ),
      content: FormCachorro(
        descricaoController: _descricaoController,
        nomeController: _nomeController,
        idadeController: _idadeController,
        onFieldSubmitted: (_) => _save(),
        formKey: _formKey,
      ),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  void _edit(Cachorro cachorro) {
    _nomeController.text = cachorro.nome ?? '';
    _descricaoController.text = cachorro.descricao ?? '';
    _idadeController.text = cachorro.idade?.toString() ?? '';

    var alert = AlertDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Editando Cachorro"),
        ],
      ),
      content: FormCachorro(
        descricaoController: _descricaoController,
        nomeController: _nomeController,
        idadeController: _idadeController,
        onFieldSubmitted: (_) => _update(cachorro),
        formKey: _formKey,
      ),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
