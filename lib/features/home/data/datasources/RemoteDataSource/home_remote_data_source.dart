import 'package:bookly/core/constants/string_constants.dart';
import 'package:bookly/core/functions/functions.dart';
import 'package:bookly/core/network/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiService apiService;
  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    int startIndex = pageNumber * 10;
    final data = await apiService.get(
        endpoint:
            "volumes?Filtering=free-ebooks&q=programming&startIndex=$startIndex");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    final data = await apiService.get(
        endpoint:
            "volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books: books, boxName: kNewestBooks);
    return books;
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var item in data["items"]) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
