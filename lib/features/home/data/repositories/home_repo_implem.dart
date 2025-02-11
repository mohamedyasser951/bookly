import 'package:bookly/core/network/failure.dart';
import 'package:bookly/features/home/data/datasources/LocalDataSource/home_local_data_source.dart';
import 'package:bookly/features/home/data/datasources/RemoteDataSource/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplem implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplem(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books;
    // books = homeLocalDataSource.getFeaturedBooks();
    // if (books.isNotEmpty) {
    //   return Right(books);
    // }
    try {
      books =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books;
    books = homeLocalDataSource.getNewestBooks(pageNumber: pageNumber);
    if (books.isNotEmpty) {
      return Right(books);
    }
    try {
      books =
          await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
