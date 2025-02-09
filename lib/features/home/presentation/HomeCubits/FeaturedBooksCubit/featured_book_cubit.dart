import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_featured_booke.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  FeaturedBookCubit({required this.fetchFeaturedBooksUseCase})
      : super(FeaturedBookInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoadingState());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold((failure) {
      emit(FeaturedBookFailureState(errorMessage: failure.message));
    }, (books) {
      emit(FeaturedBookSuccessState(books: books));
    });
  }
}
