import 'dart:developer';

import 'package:bookly/core/constants/string_constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getFeaturedBooks({int pageNumber = 0});
  List<BookEntity> getNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> getFeaturedBooks({int pageNumber = 0}) {
    log("Get featured books From Local Data Source");
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBooks);
    int length = box.length;
    log("Get featured books From Local Data Source $length");

    if (startIndex >= length || endIndex > length) {
      return [];
    }

    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> getNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kNewestBooks);
    int length = box.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
