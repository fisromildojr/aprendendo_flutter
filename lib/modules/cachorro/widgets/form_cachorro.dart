import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormCachorro extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nomeController;
  final TextEditingController descricaoController;
  final TextEditingController idadeController;
  final void Function(String)? onFieldSubmitted;
  const FormCachorro({
    super.key,
    required this.formKey,
    required this.nomeController,
    required this.descricaoController,
    required this.idadeController,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nomeController,
            autofocus: true,
            decoration: const InputDecoration(
              label: Text('Nome'),
              hintText: 'Digite o Nome',
            ),
            keyboardType: TextInputType.text,
            onFieldSubmitted: onFieldSubmitted,
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
            controller: descricaoController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Descrição'),
              hintText: 'Digite a Descrição',
            ),
            onFieldSubmitted: onFieldSubmitted,
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
            controller: idadeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Idade'),
              hintText: 'Digite a Idade',
            ),
            onFieldSubmitted: onFieldSubmitted,
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
        ],
      ),
    );
  }
}
