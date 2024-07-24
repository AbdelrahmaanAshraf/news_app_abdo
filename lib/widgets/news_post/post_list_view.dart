import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_abdo/models/cubit/news_cubit.dart';
import 'package:news_app_abdo/models/cubit/news_state.dart';
import 'package:news_app_abdo/models/news_model.dart';
import 'post_widget.dart';

class PostListView extends StatelessWidget {
  const PostListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return cubit.newsModel == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : ListView.builder(
                //physics: const BouncingScrollPhysics(),
                itemCount: cubit.newsModel?.articles?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return PostWidget(
                    articles: cubit.newsModel?.articles?[index] ?? Articles(),
                  );
                },
              );
      },
    );
  }
}
