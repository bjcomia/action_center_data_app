import 'package:flutter/material.dart';

class ArticleContent extends StatelessWidget {
  final String articleTitle;
  final String photoTitle;
  final String articleContent;

  const ArticleContent({
    Key? key,
    required this.articleTitle,
    required this.photoTitle,
    required this.articleContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Image
            Hero(
              tag: photoTitle,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(photoTitle),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleTitle,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    articleContent,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          height: 1.5,
                        ),
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
