import 'package:flutter/material.dart';
import 'package:news_app_abdo/models/news_model.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.articles});

  final Articles articles;
  //final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
                 Image.network(
              articles.urlToImage ??'',
                    fit: BoxFit.fill,
                    height: 200,
                    width: double.infinity,
                   errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error,size: 50,);
                   } ,
                  )
                ),
        const SizedBox(
          height: 10,
        ),
        Text(
          articles.title??'',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          articles.description ?? '',
          maxLines: 3,
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
              overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
