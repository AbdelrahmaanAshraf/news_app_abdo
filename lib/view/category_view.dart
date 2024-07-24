import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_abdo/models/category_model.dart';
import 'package:news_app_abdo/models/cubit/news_cubit.dart';
import 'package:news_app_abdo/models/cubit/news_state.dart';
import 'package:news_app_abdo/widgets/news_post/post_list_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
  });

  static String id = 'CategoryView';

  @override
  Widget build(BuildContext context) {
    CategoryModel categoryModel =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    var cubit = NewsCubit.get(context);
    return BlocProvider.value(
      value: NewsCubit.get(context)
        ..getNews(category: categoryModel.categoryName),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.arrow_back)),
            ),
            body: const Padding(
              padding: EdgeInsets.all(10.0),
              child: PostListView(),
            ),
          );
        },
      ),
    );
  }
}
