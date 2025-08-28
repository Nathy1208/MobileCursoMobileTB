import 'package:flutter/material.dart';


import 'package:biblioteca_app/models/books_model.dart';

class BookFormView extends StatefulWidget {
  const BookFormView({super.key});

  @override
  State<BookFormView> createState() => _BookFormViewState();
}

class _BookFormViewState extends State<BookFormView> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String author = '';
  bool avaliable = true;

  void _saveBook() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newBook = BookModel(
        title: title,
        author: author,
        avaliable: avaliable,
      );
      Navigator.pop(context, newBook);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Livro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o título' : null,
                onSaved: (value) => title = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Autor'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o autor' : null,
                onSaved: (value) => author = value ?? '',
              ),
              SwitchListTile(
                title: const Text('Disponível'),
                value: avaliable,
                onChanged: (val) => setState(() => avaliable = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveBook,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}