import 'package:aprendendo_flutter/modules/cachorro/models/cachorro_model.dart';
import 'package:flutter/material.dart';

class CachorroListPage extends StatefulWidget {
  const CachorroListPage({super.key});

  @override
  State<CachorroListPage> createState() => _CachorroListPageState();
}

class _CachorroListPageState extends State<CachorroListPage> {
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

  List<Widget> _buildCachorros() {
    List<Widget> widgets = [];
    for (var element in cachorros) {
      widgets.add(ListTile(
        title: Text(element.nome ?? '-'),
        subtitle: Text(element.descricao ?? '-'),
      ));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text("ROMILDOJR"),
              accountEmail: Text("fis.romildojr@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar.jpg"),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text(
            //     "Botão",
            //     style: TextStyle(
            //       color: MyColors.textLight,
            //     ),
            //   ),
            // ),
            Card(
              child: ListTile(
                title: Text('Home'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Cachorros'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Gatos'),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Listagem de Cachorros",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var cachorro = Cachorro(
            nome: 'Catuaba',
            descricao: 'Preto',
            idade: 10,
          );

          setState(() {
            cachorros.add(cachorro);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: cachorros.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(cachorros[index].nome ?? '-'),
            subtitle: Text(cachorros[index].descricao ?? '-'),
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
}
