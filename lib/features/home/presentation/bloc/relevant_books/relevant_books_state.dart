import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

sealed class RelevantBooksState extends Equatable {
  const RelevantBooksState();

  @override
  List<Object> get props => [];
}

final class RelevantBooksInitial extends RelevantBooksState {}

final class RelevantBooksLoading extends RelevantBooksState {}

final class RelevantBooksSuccess extends RelevantBooksState {
  final List<BookModel> books;

  const RelevantBooksSuccess(this.books);

  @override
  List<Object> get props => [books];
}

final class RelevantBooksFailure extends RelevantBooksState {
  final String errorMessage;

  const RelevantBooksFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
