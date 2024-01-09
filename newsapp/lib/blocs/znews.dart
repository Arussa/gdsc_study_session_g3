import 'package:newsapp/blocs/newsevents.dart';
import 'package:newsapp/blocs/newsstates.dart';
import 'package:newsapp/repos/newsrepo.dart';
import 'package:newsapp/structure/articlestructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZNews extends Bloc<NewsEvents, NewsStates> {
  final NewsRepository newsRepository;

  ZNews({required this.newsRepository, required NewsInitState initialState})
      : super(NewsInitState()) {
    on<StartEvent>(_onStartEvent);
  }

  void _onStartEvent(StartEvent event, Emitter<NewsStates> emit) async {
    emit(NewsLoadingState());
    try {
      List<ArticleModel> articleList = await newsRepository.fetchNews();
      emit(NewsLoadedState(articleList: articleList));
    } catch (err) {
      emit(NewsErrorState(errorMessage: err.toString()));
    }
  }

  Future<dynamic> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return "News data";
  }
}
