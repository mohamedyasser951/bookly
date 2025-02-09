import 'package:bookly/core/constants/string_constants.dart';
import 'package:bookly/core/functions/functions.dart';
import 'package:bookly/core/network/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});
  @override

  /// Fetches the list of featured books from the remote data source.
  ///
  /// The list is filtered by free e-books and sorted by relevance.
  /// The query is set to "programming".
  ///
  /// The data is fetched from the remote API using the `get` method of the
  /// `ApiService` class. The endpoint is set to "volumes" with the parameters
  /// "Filtering=free-ebooks" and "q=programming".
  ///
  /// The list of books is then converted to a list of `BookEntity` objects using
  /// the `getBooksList` function and saved to the local database using the
  /// `saveBooksData` function with the box name "kFeaturedBooks".
  ///
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final data = await apiService.get(
        endpoint: "volumes?Filtering=free-ebooks&q=programming");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kFeaturedBooks);
    return books;
  }

  @override

  /// Fetches the list of newest books from the remote data source.
  /// The list is filtered by free e-books and sorted by newest.
  /// The query is set to "programming".
  Future<List<BookEntity>> fetchNewestBooks() async {
    final data = await apiService.get(
        endpoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=programming");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kNewestBooks);
    return books;
  }
}

/// Converts a map of data into a list of `BookEntity` objects.
///
/// Takes a map [data] that contains a key "items" with a list of book data.
/// Each item is converted to a `BookModel` using `fromJson` method and added
/// to the list of `BookEntity`.
///
/// Returns a list of `BookEntity` objects parsed from the input data.

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var item in data["items"]) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
