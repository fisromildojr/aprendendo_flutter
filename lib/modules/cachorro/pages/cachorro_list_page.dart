import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
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
        onPressed: () {
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
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nomeController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      label: Text('Nome'),
                      hintText: 'Digite o Nome',
                    ),
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (_) => _save(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (value.length < 3) {
                        return 'Mínimo 3 caracteres';
                      }
                      // Retorna null se passar nas validações
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descricaoController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Descrição'),
                      hintText: 'Digite a Descrição',
                    ),
                    onFieldSubmitted: (_) => _save(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      } else if (value.length < 5) {
                        return 'Mínimo 5 caracteres';
                      }
                      // Retorna null se passar nas validações
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _idadeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Idade'),
                      hintText: 'Digite a Idade',
                    ),
                    onFieldSubmitted: (_) => _save(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      // Retorna null se passar nas validações
                      return null;
                    },
                  ),
                  // TextFormField(
                  //   autofocus: true,
                  //   keyboardType: TextInputType.text,
                  //   onChanged: (value) => cachorro.nome = value,
                  //   onFieldSubmitted: (value) {
                  //     if (_formKey.currentState?.validate() ?? false) {
                  //       cachorro.nome = value;
                  //       setState(() {
                  //         cachorros.add(cachorro);
                  //       });
                  //       Navigator.of(context).pop();
                  //     }
                  //   },
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Campo obrigatório';
                  //     } else if (value.length < 3) {
                  //       return 'Mínimo 3 caracteres';
                  //     }
                  //     // Retorna null se passar nas validações
                  //     return null;
                  //   },
                  // ),
                ],
              ),
            ),
          );

          showDialog(
            context: context,
            builder: (context) => alert,
          );
        },
        // onPressed: () {
        //   var cachorro = Cachorro(
        //     nome: 'Catuaba',
        //     descricao: 'Preto',
        //     idade: 10,
        //   );

        //   setState(() {
        //     cachorros.add(cachorro);
        //   });
        // },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: cachorros.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(cachorros[index].nome ?? '-'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cachorros[index].descricao ?? '-'),
                Text('${cachorros[index].idade} Anos'),
              ],
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
}
