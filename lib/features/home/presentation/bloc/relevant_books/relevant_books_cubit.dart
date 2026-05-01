import 'package:bookly/features/home/data/repos/home_repo_data.dart';
import 'package:bookly/features/home/presentation/bloc/relevant_books/relevant_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelevantBooksCubit extends Cubit<RelevantBooksState> {
  RelevantBooksCubit({required HomeRepoData homeRepoData})
    : _homeRepoData = homeRepoData,
      super(RelevantBooksInitial());

  final HomeRepoData _homeRepoData;

  Future<void> fetchRelevantBooks({required String category}) async {
    emit(RelevantBooksLoading());
    final result = await _homeRepoData.relentsBooks(category: category);
    result.fold(
      (failure) => emit(RelevantBooksFailure(failure.message)),
      (books) => emit(RelevantBooksSuccess(books)),
    );
  }
}
