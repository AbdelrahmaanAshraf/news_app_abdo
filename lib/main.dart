import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_abdo/models/cubit/news_cubit.dart';
import 'package:news_app_abdo/services/network/dio_helper.dart';
import 'package:news_app_abdo/view/category_view.dart';
import 'package:news_app_abdo/view/home_view.dart';
import 'package:news_app_abdo/view/show_news.dart';

void main() {
  DioHelper.init();
  runApp(const NewsApp());
}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
 // api key e7c4195786cf4a48a6729fa7bc183094
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> NewsCubit()..getNews(category: 'General')),
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          CategoryView.id : (context) => const CategoryView(),
          HomeView.id : (context) =>const HomeView(),
          ShowNews.id : (context) =>const ShowNews(),
        },
        home: ShowNews(),
      ),
    );
  }
}

