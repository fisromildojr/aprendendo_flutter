import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:aprendendo_flutter/modules/cachorro/widgets/form_cachorro.dart';
import 'package:aprendendo_flutter/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CachorroListPage extends StatefulWidget {
  const CachorroListPage({super.key});

  @override
  State<CachorroListPage> createState() => _CachorroListPageState();
}

class _CachorroListPageState extends State<CachorroListPage> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _idadeController = TextEditingController();

  List<Cachorro> cachorros = [
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

  @override
  Widget build(BuildContext context) {
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
        itemCount: cachorros.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text(cachorros[index].nome ?? '-'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cachorros[index].descricao ?? '-'),
                  Text('${cachorros[index].idade} Anos'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => _edit(cachorros[index]),
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.amber,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _delete(cachorros[index]),
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

      // body: ListView(
      //   children: _buildCachorros(),
      // ),

      // body: SingleChildScrollView(
      //   child: Column(
      //     children: _buildCachorros(),
      //     // children: [
      //     //   // for(int i=0; i<cachorros.length; i++)
      //     //   // ListTile(
      //     //   //   title: Text(cachorros[i].nome ?? '-'),
      //     //   //   subtitle: Text(cachorros[i].descricao ?? '-'),
      //     //   // ),

      //     // ],
      //   ),
      // ),
    );
  }

  void _save() {
    if (_formKey.currentState?.validate() ?? false) {
      var cachorro = Cachorro(
        nome: _nomeController.text,
        descricao: _descricaoController.text,
        idade: int.parse(_idadeController.text),
      );
      setState(() {
        cachorros.add(cachorro);
      });
      Navigator.of(context).pop();
    }
  }

  void _update(Cachorro cachorro) {
    if (_formKey.currentState?.validate() ?? false) {
      // Recupera o cachorro para edição
      var cachorroEdit = cachorros.firstWhere((element) => element == cachorro);

      // Remove o cachorro da lista
      cachorros.removeWhere((element) => element == cachorro);

      // Edita o cachorro recuperado com os novos valores
      cachorroEdit.nome = _nomeController.text;
      cachorroEdit.descricao = _descricaoController.text;
      cachorroEdit.idade = int.parse(_idadeController.text);

      setState(() {
        cachorros.add(cachorroEdit);
      });
      Navigator.of(context).pop();
    }
  }

  void _delete(Cachorro cachorro) {
    setState(() {
      cachorros.removeWhere((element) => element == cachorro);
    });
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
