import 'package:flutter/material.dart';
import 'package:action_center_data_app/pages/article_content_page.dart';
import 'package:action_center_data_app/tempData/dummy_data.dart';

class ArticleMenu extends StatelessWidget {
  const ArticleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "Articles",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
        itemCount: tempData.length,
        itemBuilder: (context, index) {
          return AnimatedArticleContainer(
            title: tempData[index]["title"] ?? "",
            imageUrl: tempData[index]["imageUrl"] ?? "",
            content: tempData[index]["subTitle"] ?? "",
            index: index,
          );
        },
      ),
    );
  }
}

class AnimatedArticleContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;
  final int index;

  const AnimatedArticleContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 1, end: 0),
      duration: Duration(milliseconds: 500 + (index * 100)),
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * value),
          child: Opacity(
            opacity: 1 - value,
            child: child,
          ),
        );
      },
      child: ArticleContainer(
        title: title,
        imageUrl: imageUrl,
        content: content,
      ),
    );
  }
}

class ArticleContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;

  const ArticleContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ArticleContent(
                articleTitle: title,
                photoTitle: imageUrl,
                articleContent: content,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(2.5, 5),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.asset(
                imageUrl,
                height: 205,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
