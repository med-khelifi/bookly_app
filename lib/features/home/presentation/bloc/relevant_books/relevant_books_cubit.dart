
import 'package:bookly/features/home/presentation/bloc/relevant_books/relevant_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelevantBooksCubit extends Cubit<RelevantBooksState> {
  RelevantBooksCubit() : super(RelevantBooksInitial());
}
