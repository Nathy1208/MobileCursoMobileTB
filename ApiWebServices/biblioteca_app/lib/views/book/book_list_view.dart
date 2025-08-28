import 'package:flutter/material.dart';



import 'package:biblioteca_app/models/books_model.dart';
import 'package:biblioteca_app/controllers/book_controller.dart';
import 'book_form_view.dart';

class BookListView extends StatefulWidget {
  const BookListView({super.key});

  @override
  State<BookListView> createState() => _BookListViewState();
}


class _BookListViewState extends State<BookListView> {
  final BookController _controller = BookController();
  List<BookModel> books = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    setState(() => loading = true);
    try {
      books = await _controller.fetchAll();
    } catch (e) {
      // erro ao buscar livros
      books = [];
    }
    setState(() => loading = false);
  }

  void _addBook() async {
    final newBook = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BookFormView()),
    );
    if (newBook != null && newBook is BookModel) {
      await _controller.create(newBook);
      await _loadBooks();
    }
  }

  void _deleteBook(String id) async {
    await _controller.delete(id);
    await _loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Livros')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : books.isEmpty
              ? const Center(child: Text('Nenhum livro encontrado'))
              : ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(book.avaliable ? Icons.check : Icons.close, color: book.avaliable ? Colors.green : Colors.red),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteBook(book.id!),
                          ),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBook,
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Livro',
      ),
    );
  }
}