import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required HomeRepoData homeRepo})
    : _homeRepo = homeRepo,
      super(NewestBooksInitial());
  final HomeRepoData _homeRepo;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await _homeRepo.fetchNewestBooks();
    result.fold(
      (failure) => emit(NewestBooksError(failure.message)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }
}
