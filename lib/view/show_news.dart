import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_abdo/widgets/categories/categories_list_view.dart';
import 'package:news_app_abdo/widgets/news_post/post_widget.dart';

import '../models/cubit/news_cubit.dart';
import '../models/cubit/news_state.dart';
import '../models/news_model.dart';

class ShowNews extends StatefulWidget {
  const ShowNews({super.key});

  static String id = 'ShowNews';

  @override
  State<ShowNews> createState() => _ShowNewsState();
}

class _ShowNewsState extends State<ShowNews> {
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('App',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange)),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocProvider.value(

        value: NewsCubit.get(context)..getNews(category: 'General'),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: CategoriesListView(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: cubit.newsModel?.articles?.length ?? 0,
                    (context, index) => PostWidget(
                        articles:
                            cubit.newsModel?.articles?[index] ?? Articles()),
                  )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
