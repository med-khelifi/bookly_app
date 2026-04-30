import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit({required HomeRepoData homeRepo})
    : _homeRepo = homeRepo,
      super(FeaturedBookInitial());
  final HomeRepoData _homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await _homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) => emit(FeaturedBookError(failure.message)),
      (books) => emit(FeaturedBookSuccess(books)),
    );
  }
}
