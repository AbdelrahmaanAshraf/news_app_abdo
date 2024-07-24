import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_abdo/models/category_model.dart';
import 'package:news_app_abdo/models/cubit/news_state.dart';
import 'package:news_app_abdo/models/news_model.dart';
import 'package:news_app_abdo/services/end_point.dart';
import 'package:news_app_abdo/services/network/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  CategoryModel? categoryModel;
  NewsModel? newsModel;

  Future<void> getNews({required String category}) async {
    emit(NewsLoadingState());
    await DioHelper.get(endPoint: topHeadlines, queryParameters: {
      'apiKey': apiKey,
      'category': category,
      'country': 'us'
    }).then((response){
      newsModel = NewsModel.fromJson(response.data);
      emit(NewsSuccessState());
    }).catchError((e){
      emit(NewsFailureState());
    });
  }
}
