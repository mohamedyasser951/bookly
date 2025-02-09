part of 'newest_books_cubit.dart';

sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoadingState extends NewestBooksState {}

final class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> books;
  NewestBooksSuccessState({required this.books});
}

final class NewestBooksFailureState extends NewestBooksState {
  final String errorMessage;
  NewestBooksFailureState({required this.errorMessage});
}
