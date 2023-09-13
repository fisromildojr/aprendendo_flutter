import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          Card(
            child: ListTile(
              title: Text('Ratos'),
            ),
          ),
        ],
      ),
    );
  }
}
