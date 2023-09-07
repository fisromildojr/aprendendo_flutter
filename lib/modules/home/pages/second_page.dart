import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SecondPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(
                'TITULO SECOND PAGE',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Text('Segundo Texto'),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
