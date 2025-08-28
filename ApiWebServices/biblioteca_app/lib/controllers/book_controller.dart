
import 'package:biblioteca_app/models/books_model.dart';
import 'package:biblioteca_app/services/api_services.dart';

class BookController {
  // GET livros
  Future<List<BookModel>> fetchAll() async {
    final list = await ApiService.getList("books?_sort=title");
    return list.map<BookModel>((item) => BookModel.fromMap(item)).toList();
  }

  // POST -> Criar novo livro
  Future<BookModel> create(BookModel book) async {
    final created = await ApiService.post("books", book.toMap());
    return BookModel.fromMap(created);
  }

  // GET -> buscar um livro
  Future<BookModel> fetchOne(String id) async {
    final book = await ApiService.getOne("books", id);
    return BookModel.fromMap(book);
  }

  // PUT -> atualizar livro
  Future<BookModel> update(BookModel book) async {
    final updated = await ApiService.put("books", book.toMap(), book.id!);
    return BookModel.fromMap(updated);
  }

  // DELETE -> apagar livro
  Future<void> delete(String id) async {
    await ApiService.delete("books", id);
  }
}