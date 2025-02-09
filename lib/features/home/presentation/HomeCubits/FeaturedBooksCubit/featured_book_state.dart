part of 'featured_book_cubit.dart';

sealed class FeaturedBookState {}

final class FeaturedBookInitial extends FeaturedBookState {}

final class FeaturedBookLoadingState extends FeaturedBookState {}

final class FeaturedBookSuccessState extends FeaturedBookState {
  final List<BookEntity> books;
  FeaturedBookSuccessState({required this.books});
}

final class FeaturedBookFailureState extends FeaturedBookState {
  final String errorMessage;
  FeaturedBookFailureState({required this.errorMessage});
}
